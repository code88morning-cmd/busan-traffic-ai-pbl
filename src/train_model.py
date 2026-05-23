import json
import numpy as np
import pandas as pd
import joblib
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import Ridge
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

from config import DEFAULT_X_PATH, DEFAULT_Y_PATH, MODEL_DIR


def metric_dict(y_true, y_pred):
    return {
        "MAE": float(mean_absolute_error(y_true, y_pred)),
        "RMSE": float(np.sqrt(mean_squared_error(y_true, y_pred))),
        "R2": float(r2_score(y_true, y_pred)),
    }


def main():
    MODEL_DIR.mkdir(parents=True, exist_ok=True)

    df_x = pd.read_csv(DEFAULT_X_PATH)
    df_y = pd.read_csv(DEFAULT_Y_PATH)
    df_x["date"] = pd.to_datetime(df_x["date"])
    df_y["date"] = pd.to_datetime(df_y["date"])

    y_candidates = [c for c in df_y.columns if c != "date"]
    y_col = "traffic_total" if "traffic_total" in y_candidates else y_candidates[0]

    df = df_x.merge(df_y[["date", y_col]], on="date", how="inner").sort_values("date")
    df = df.rename(columns={
        "평균기온(℃)": "avg_temp",
        "최저기온(℃)": "min_temp",
        "최고기온(℃)": "max_temp",
        "강수량(mm)": "precipitation",
    })

    train_mask = df["date"].dt.year == 2022
    test_mask = df["date"].dt.year == 2023
    df_train = df[train_mask].copy()
    df_test = df[test_mask].copy()

    feature_cols = [c for c in df.columns if c not in ["date", y_col]]
    X_train, y_train = df_train[feature_cols], df_train[y_col]
    X_test, y_test = df_test[feature_cols], df_test[y_col]

    model = Pipeline([
        ("imputer", SimpleImputer(strategy="median")),
        ("scaler", StandardScaler()),
        ("regressor", RandomForestRegressor(n_estimators=300, random_state=42, n_jobs=-1)),
    ])
    model.fit(X_train, y_train)
    pred = model.predict(X_test)
    metrics = metric_dict(y_test, pred)

    joblib.dump(model, MODEL_DIR / "busan_traffic_model.joblib")
    joblib.dump(feature_cols, MODEL_DIR / "feature_cols.joblib")
    joblib.dump(y_col, MODEL_DIR / "y_col.joblib")
    (MODEL_DIR / "metrics.json").write_text(json.dumps(metrics, ensure_ascii=False, indent=2), encoding="utf-8")

    print("saved:", MODEL_DIR / "busan_traffic_model.joblib")
    print(metrics)


if __name__ == "__main__":
    main()
