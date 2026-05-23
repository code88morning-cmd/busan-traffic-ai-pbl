# Busan Traffic AI PBL

![Busan Traffic AI PBL Preview](docs/images/busan-traffic-ai-pbl-preview.png)

공공데이터 기반 **부산시 교통량 예측 AI 웹서비스 개발 PBL 프로젝트**입니다.

이 프로젝트는 기존 **서울시 교통량 예측 실습 노트북**을 기반으로 분석 대상과 서비스 시나리오를 **부산시**로 변경한 프로젝트입니다. 부산의 관광지, 항만, 도심 출퇴근, 행사, 기상 변화 특성을 반영하여 교통량 예측 모델을 만들고, Streamlit 기반 웹서비스로 예측 결과를 시각화합니다.

> 본 프로젝트는 학습 및 포트폴리오 목적의 PBL 프로젝트입니다. 실제 교통 행정 의사결정, 상용 예측 서비스, 공공기관 운영 시스템을 대체하지 않습니다.

---

## 1. Project Overview

**Busan Traffic AI PBL**은 부산시 교통량 데이터를 중심으로 기상, 대기질, 공휴일 여부 등 외부 요인을 결합하여 교통량을 예측하는 AI 웹서비스 프로젝트입니다.

학습자는 프로젝트 수행 과정에서 다음 흐름을 경험합니다.

```text
문제 정의
→ 공공데이터 수집
→ 데이터 전처리
→ 머신러닝 / 딥러닝 모델 학습
→ 모델 성능 평가
→ 예측 결과 시각화
→ Streamlit 웹서비스 구현
→ PBL 산출물 정리
```

이 프로젝트의 목적은 단순히 모델을 학습시키는 것이 아니라, **공공데이터 기반 문제해결 과정 전체를 PBL 방식으로 수행하는 것**입니다.

---

## 2. Why This Project?

부산은 일반적인 대도시 교통 문제뿐 아니라 지역 특성이 강한 교통 변동 요인을 가지고 있습니다.

| 부산시 특성 | 교통량에 미치는 영향 |
|---|---|
| 해운대·광안리 등 관광지 | 주말, 휴가철, 축제 기간 교통량 증가 |
| 부산항·물류 거점 | 평일 물류 차량 이동량 증가 |
| 서면·부산역 등 도심 | 출퇴근 시간대 혼잡 발생 |
| 센텀시티·벡스코 | 행사일 교통량 급증 가능 |
| 강수·태풍·폭염 등 기상 변화 | 이동량 감소 또는 특정 구간 정체 발생 가능 |
| 공휴일·주말 | 평일과 다른 교통 패턴 발생 |

따라서 부산시 교통량 예측은 단순히 시간대별 평균을 보는 것이 아니라, **지역 특성, 날짜 특성, 기상 조건, 대기질, 공휴일 여부를 함께 고려하는 데이터 기반 예측 문제**로 접근해야 합니다.

---

## 3. Project Goals

- 부산시 교통량 예측 문제를 AI 문제해결 관점에서 정의한다.
- 부산시 교통량, 기온, 강수량, 대기질, 공휴일 데이터를 수집하고 전처리한다.
- 요일, 시간대, 주말 여부, 공휴일 여부 등 파생변수를 생성한다.
- 머신러닝 모델을 활용하여 부산시 교통량을 예측한다.
- PyTorch 기반 MLP 모델을 활용하여 딥러닝 예측 구조를 실습한다.
- 모델 성능을 MAE, RMSE, R² 등 지표로 평가한다.
- Streamlit을 활용하여 예측 결과를 웹서비스 형태로 시각화한다.
- PBL 과정 산출물을 GitHub 포트폴리오로 정리한다.

---

## 4. PBL Learning Flow

이 프로젝트는 PBL 5단계 흐름에 맞춰 진행합니다.

| PBL 단계 | 수행 내용 | 주요 산출물 |
|---|---|---|
| 1. 과제 설정 | 부산시 교통 문제 정의, 사용자 설정 | 문제정의서 |
| 2. 정보수집·계획수립 | 데이터 출처 조사, 변수 선정, 역할분담 | 데이터 조사표, 실행계획서 |
| 3. 계획 확정 | 요구사항 정의, WBS, 테스트 시나리오 작성 | 요구사항 정의서, WBS |
| 4. 실행 | 데이터 수집, 전처리, 모델 학습, 웹서비스 구현 | 코드, 모델, Streamlit 앱 |
| 5. 발표·평가 | 결과 발표, 자기평가, 동료평가, KPT 회고 | 발표자료, 회고서, 포트폴리오 |

---

## 5. Service Scenario

사용자는 웹 화면에서 지역, 날짜, 시간대, 날씨 조건 등을 입력하고 예상 교통량 또는 혼잡 수준을 확인할 수 있습니다.

### Example User Flow

```text
지역 선택
→ 날짜 및 시간대 선택
→ 기온·강수량·대기질 조건 입력
→ 예측 실행
→ 예상 교통량 확인
→ 그래프 및 해석 문구 확인
```

### Example Output

```text
예상 교통량: 18,420대
혼잡 수준: 혼잡
해석: 공휴일과 강수 조건이 함께 반영되어 평일 평균보다 높은 혼잡이 예상됩니다.
```

---

## 6. Data Sources

실제 프로젝트에서는 아래 데이터를 수집하여 `data/raw/` 또는 `data/processed/`에 저장합니다.

| 데이터 | 활용 목적 | 예시 컬럼 |
|---|---|---|
| 부산시 교통량 데이터 | 예측 대상값 | 일시, 지점명, 교통량 |
| 부산시 기온 데이터 | 기상 변수 | 일시, 기온 |
| 부산시 강수량 데이터 | 기상 변수 | 일시, 강수량 |
| 부산시 대기오염도 데이터 | 환경 변수 | PM10, PM2.5, O3, NO2 |
| 공휴일 데이터 | 날짜 변수 | 날짜, 공휴일 여부 |
| 파생변수 | 모델 입력 변수 | 요일, 시간대, 주말 여부, 계절 |

### Recommended Final Dataset Columns

```text
datetime
region
traffic_volume
temperature
precipitation
pm10
pm25
o3
no2
weekday
hour
is_weekend
is_holiday
season
```

---

## 7. Tech Stack

| Area | Stack |
|---|---|
| Language | Python |
| Data Processing | Pandas, NumPy |
| Database | MySQL 또는 SQLite |
| Machine Learning | scikit-learn |
| Deep Learning | PyTorch |
| Visualization | Matplotlib, Seaborn, Plotly |
| Web App | Streamlit |
| Collaboration | GitHub, Slack, Padlet |
| Documentation | Markdown, GitHub README |

---

## 8. Main Features

### 8.1 Data Collection

- 공공데이터 API 또는 CSV 기반 데이터 수집
- 교통량, 기상, 대기질, 공휴일 데이터 결합
- 원본 데이터와 전처리 데이터 분리 저장

### 8.2 Data Preprocessing

- 결측치 처리
- 이상치 확인
- 날짜·시간 컬럼 변환
- 요일, 주말 여부, 공휴일 여부 파생변수 생성
- 모델 학습용 데이터셋 생성

### 8.3 Model Training

- 기본 회귀 모델 학습
- 트리 기반 모델 학습
- PyTorch 기반 MLP 모델 실습
- 모델별 성능 비교
- 최종 모델 선정 사유 기록

### 8.4 Model Evaluation

- MAE
- RMSE
- R²
- 실제값과 예측값 비교 그래프
- 모델 한계 분석

### 8.5 Streamlit Web Service

- 지역 선택
- 날짜·시간 조건 입력
- 기온·강수량·대기질 조건 입력
- 예측 결과 출력
- 그래프 시각화
- 해석 문구 제공

---

## 9. Project Structure

```text
busan-traffic-ai-pbl/
├─ README.md
├─ requirements.txt
├─ .env.example
│
├─ data/
│  ├─ raw/
│  │  └─ .gitkeep
│  └─ processed/
│     ├─ merged_x.csv
│     └─ traffic_daily_total_2022_2023.csv
│
├─ notebooks/
│  ├─ 03_busan_baseline_ml.ipynb
│  ├─ 08_busan_weather_api.ipynb
│  ├─ 09_busan_sql_storage.ipynb
│  ├─ 14_busan_air_quality_preprocessing.ipynb
│  ├─ 15_busan_ml_model_training.ipynb
│  ├─ 16_busan_pytorch_mlp.ipynb
│  ├─ 17_busan_hyperparameter_tuning.ipynb
│  ├─ 18_busan_model_visualization.ipynb
│  ├─ 19_busan_model_interpretation.ipynb
│  └─ 20_busan_streamlit_service.ipynb
│
├─ src/
│  ├─ config.py
│  └─ train_model.py
│
├─ app/
│  └─ streamlit_app.py
│
├─ docs/
│  ├─ data_sources.md
│  ├─ project_plan.md
│  └─ images/
│     └─ busan-traffic-ai-pbl-preview.png
│
├─ models/
│  └─ .gitkeep
│
└─ presentation/
   └─ .gitkeep
```

---

## 10. Quick Start

### 10.1 Install Dependencies

```bash
pip install -r requirements.txt
```

### 10.2 Train Model

```bash
python src/train_model.py
```

### 10.3 Run Streamlit App

```bash
streamlit run app/streamlit_app.py
```

실행 후 브라우저에서 아래 주소로 접속합니다.

```text
http://localhost:8501
```

---

## 11. Environment Variables

API Key 또는 외부 토큰은 코드에 직접 작성하지 않습니다.

`.env.example`을 참고하여 `.env` 파일을 생성합니다.

```bash
cp .env.example .env
```

Example:

```env
KMA_API_KEY=your_kma_api_key
DATA_GO_KR_API_KEY=your_data_go_kr_api_key
DB_HOST=localhost
DB_PORT=3306
DB_NAME=busan_traffic
DB_USER=root
DB_PASSWORD=your_password
```

`.env` 파일은 GitHub에 올리지 않습니다.

---

## 12. Data Files

샘플 실행을 위해 합성 데이터가 포함되어 있습니다.

```text
data/processed/merged_x.csv
data/processed/traffic_daily_total_2022_2023.csv
```

실제 프로젝트에서는 부산시 교통량, 기온, 강수량, 대기질, 공휴일 데이터를 수집한 뒤 위 파일 구조에 맞게 대체합니다.

---

## 13. Model Pipeline

```text
Raw Data
→ Data Cleaning
→ Feature Engineering
→ Train/Test Split
→ Model Training
→ Model Evaluation
→ Prediction Result
→ Streamlit Visualization
```

### Feature Examples

| Feature | Description |
|---|---|
| `temperature` | 기온 |
| `precipitation` | 강수량 |
| `pm10` | 미세먼지 |
| `pm25` | 초미세먼지 |
| `is_holiday` | 공휴일 여부 |
| `is_weekend` | 주말 여부 |
| `hour` | 시간대 |
| `weekday` | 요일 |
| `region` | 측정 지역 또는 교통 지점 |

---

## 14. PBL Deliverables

| Category | Deliverable |
|---|---|
| Planning | 문제정의서, 프로젝트 기획안, 팀별 주제 선정표 |
| Data | 데이터 조사표, 데이터 명세서, 원본 데이터, 전처리 데이터 |
| Design | 요구사항 정의서, WBS, 테스트 시나리오, ERD, 화면 설계서 |
| Development | 데이터 수집 코드, 전처리 코드, 모델 학습 코드, Streamlit 앱 |
| Evaluation | 모델 성능 비교표, 테스트 결과서, 루브릭 평가표 |
| Presentation | 최종 발표자료, 실행 화면 캡처, 시연 영상 |
| Portfolio | GitHub Repository, README.md, 프로젝트 보고서, KPT 회고서 |

---

## 15. Evaluation Criteria

| Criteria | Description |
|---|---|
| Problem Definition | 부산시 교통 문제를 데이터 기반 예측 문제로 정의했는가 |
| Data Quality | 데이터 출처, 컬럼, 결측치, 이상치 처리 기준이 명확한가 |
| Modeling | 예측 모델을 학습하고 성능을 비교했는가 |
| Visualization | 사용자가 이해할 수 있도록 결과를 시각화했는가 |
| Web Service | Streamlit으로 예측 결과를 서비스 형태로 구현했는가 |
| Collaboration | GitHub Issue, Commit, 역할분담 기록이 남아 있는가 |
| Reflection | KPT 회고를 통해 문제점과 개선 방향을 도출했는가 |

---

## 16. Security Notice

업로드된 원본 노트북에는 API Key 또는 ngrok token이 직접 작성된 셀이 포함되어 있었습니다.

이 프로젝트에서는 해당 값을 제거하고 `.env.example` 구조로 변경했습니다.

### Do Not Commit

```text
.env
*.key
*.pem
API_KEY
ngrok token
개인 인증키
```

실제 키는 `.env` 또는 운영환경의 환경변수로 관리해야 하며, GitHub에 올리면 안 됩니다.

---

## 17. Recommended Repository Name

```text
busan-traffic-ai-pbl
```

---

## 18. Commit Message Examples

```bash
git commit -m "chore: initialize Busan traffic AI PBL project"
git commit -m "docs: update README with preview image"
git commit -m "feat: add Streamlit traffic prediction app"
git commit -m "feat: add baseline traffic prediction model"
git commit -m "docs: add PBL project deliverables"
```

---

## 19. License

This project is for educational and portfolio purposes.

The prediction results are based on sample data or public data preprocessing and should not be interpreted as official traffic forecasts.
