# Busan Traffic AI PBL

공공데이터 기반 부산시 교통량 예측 AI 웹서비스 개발 PBL 프로젝트입니다.

서울시 교통량 예측 실습 노트북을 바탕으로, 분석 대상과 서비스 시나리오를 부산시로 변경했습니다. 부산의 관광지, 항만, 도심 출퇴근, 행사, 기상 변화 특성을 반영하여 교통량 예측 모델과 Streamlit 웹서비스를 구성합니다.

## 프로젝트 목표

- 부산시 교통량 예측 문제를 AI 문제해결 관점에서 정의한다.
- 공공데이터, 기상 데이터, 대기질 데이터, 공휴일 데이터를 수집·전처리한다.
- 머신러닝과 PyTorch 기반 모델을 활용하여 교통량을 예측한다.
- Streamlit으로 예측 결과를 웹서비스 형태로 시각화한다.
- PBL 과정 산출물을 GitHub 포트폴리오로 정리한다.

## 기술 스택

| 구분 | 내용 |
|---|---|
| Language | Python |
| Data | Pandas, NumPy |
| DB | MySQL 또는 SQLite 실습 |
| ML | scikit-learn |
| DL | PyTorch |
| Web | Streamlit |
| Collaboration | GitHub, Slack/Padlet |

## 프로젝트 구조

```text
busan-traffic-ai-pbl/
├─ README.md
├─ requirements.txt
├─ .env.example
├─ data/
│  ├─ raw/
│  └─ processed/
├─ notebooks/
├─ src/
│  ├─ config.py
│  └─ train_model.py
├─ app/
│  └─ streamlit_app.py
├─ docs/
└─ models/
```

## 빠른 실행

```bash
pip install -r requirements.txt
python src/train_model.py
streamlit run app/streamlit_app.py
```

## 데이터 파일

샘플 실행을 위해 합성 데이터가 포함되어 있습니다.

```text
data/processed/merged_x.csv
data/processed/traffic_daily_total_2022_2023.csv
```

실제 프로젝트에서는 부산시 교통량, 기온, 강수량, 대기질, 공휴일 데이터를 수집한 뒤 위 파일 구조에 맞게 대체합니다.

## 보안 주의

업로드된 원본 노트북에는 API Key 또는 ngrok token이 직접 작성된 셀이 포함되어 있었습니다. 이 프로젝트에서는 해당 값을 제거하고 `.env.example` 구조로 변경했습니다. 실제 키는 `.env` 또는 환경변수로 관리해야 하며 GitHub에 올리면 안 됩니다.

## 추천 GitHub Repository 이름

```text
busan-traffic-ai-pbl
```

## 초기 커밋 메시지

```bash
git commit -m "chore: initialize Busan traffic AI PBL project"
```
# busan-traffic-ai-pbl
