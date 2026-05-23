import json
from pathlib import Path
import numpy as np
import pandas as pd
import streamlit as st
import joblib
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
DATA_PATH = ROOT / "data" / "processed" / "merged_x.csv"
MODEL_PATH = ROOT / "models" / "busan_traffic_model.joblib"
FEATURE_PATH = ROOT / "models" / "feature_cols.joblib"
METRICS_PATH = ROOT / "models" / "metrics.json"

st.set_page_config(page_title="Busan Traffic AI PBL", layout="wide")
st.title("부산시 교통량 예측 AI 웹서비스")
st.caption("공공데이터 기반 PBL 프로젝트 | Python · MySQL · Machine Learning · Streamlit")

@st.cache_data
def load_data():
    df = pd.read_csv(DATA_PATH)
    df["date"] = pd.to_datetime(df["date"])
    return df.rename(columns={
        "평균기온(℃)": "avg_temp",
        "최저기온(℃)": "min_temp",
        "최고기온(℃)": "max_temp",
        "강수량(mm)": "precipitation",
    })

@st.cache_resource
def load_model():
    if not MODEL_PATH.exists():
        return None, None
    return joblib.load(MODEL_PATH), joblib.load(FEATURE_PATH)

df = load_data()
model, feature_cols = load_model()

left, right = st.columns([1, 2])

with left:
    st.subheader("예측 조건 입력")
    target_area = st.selectbox("부산 주요 권역", ["해운대·광안리", "서면·부산역", "부산항", "센텀시티·벡스코", "기상 영향 분석"])
    selected_date = st.date_input("날짜", value=pd.Timestamp("2023-08-15"))
    avg_temp = st.slider("평균기온(℃)", -5.0, 35.0, float(df["avg_temp"].mean()), 0.5)
    precipitation = st.slider("강수량(mm)", 0.0, 100.0, float(df["precipitation"].median()), 0.5)
    pm10 = st.slider("미세먼지 PM10", 0.0, 150.0, float(df["PM10"].mean()), 1.0)
    is_holiday = st.checkbox("공휴일", value=False)
    is_event_period = st.checkbox("행사·축제 기간", value=(target_area == "센텀시티·벡스코"))

    row = df.drop(columns=["date"], errors="ignore").median(numeric_only=True).to_dict()
    dt = pd.Timestamp(selected_date)
    row.update({
        "avg_temp": avg_temp,
        "min_temp": avg_temp - 4,
        "max_temp": avg_temp + 4,
        "precipitation": precipitation,
        "PM10": pm10,
        "PM25": pm10 * 0.55,
        "weekday": dt.weekday(),
        "month": dt.month,
        "is_weekend": int(dt.weekday() >= 5),
        "is_holiday": int(is_holiday),
        "is_event_period": int(is_event_period),
        "is_summer_peak": int(dt.month in [7, 8]),
    })

with right:
    st.subheader("예측 결과")
    if model is None:
        st.warning("모델 파일이 없습니다. 먼저 `python src/train_model.py`를 실행하세요.")
    else:
        input_df = pd.DataFrame([{c: row.get(c, 0) for c in feature_cols}])
        pred = float(model.predict(input_df)[0])
        level = "원활" if pred < 220000 else "보통" if pred < 260000 else "혼잡"
        st.metric("예상 일 교통량", f"{pred:,.0f} 대", level)
        st.write("선택 권역:", target_area)

        if METRICS_PATH.exists():
            metrics = json.loads(METRICS_PATH.read_text(encoding="utf-8"))
            st.write("모델 평가:", metrics)

        recent = pd.read_csv(ROOT / "data" / "processed" / "traffic_daily_total_2022_2023.csv")
        recent["date"] = pd.to_datetime(recent["date"])
        recent = recent.tail(90)
        fig, ax = plt.subplots(figsize=(10, 4))
        ax.plot(recent["date"], recent["traffic_total"])
        ax.axhline(pred, linestyle="--")
        ax.set_title("최근 교통량 추이와 입력 조건 예측값")
        ax.set_xlabel("date")
        ax.set_ylabel("traffic_total")
        st.pyplot(fig)

st.divider()
st.subheader("PBL 산출물 체크")
st.markdown("""
- 문제정의서: 부산시 교통량 예측 필요성 및 활용 대상 정의
- 데이터 명세서: 교통량·기온·강수량·대기질·공휴일 데이터 출처와 컬럼 정의
- 모델 보고서: 모델 비교, 성능 지표, 한계 분석
- 서비스 구현: Streamlit 기반 예측 화면
- 회고서: KPT 방식의 프로젝트 성찰
""")
