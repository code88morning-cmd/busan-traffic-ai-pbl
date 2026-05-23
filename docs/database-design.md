# Database Design

본 DB 설계는 부산시 교통량 예측 PBL 프로젝트의 학습용 데이터 저장 구조입니다. 목적은 교통량, 기상, 대기질, 공휴일, 모델 학습 이력, 예측 결과를 분리하여 저장하고, 모델 학습용 통합 피처 데이터셋을 재현 가능하게 관리하는 것입니다.

## Design Goals

- 원천 데이터와 모델 학습용 데이터를 분리한다.
- 교통량 측정 지점과 관측값을 분리한다.
- 기상, 대기질, 공휴일 데이터를 독립 테이블로 관리한다.
- 모델 학습 이력과 예측 결과를 저장하여 실험 재현성을 확보한다.
- Streamlit 앱에서 예측 결과 및 과거 데이터를 조회할 수 있도록 한다.

## Core Tables

| Table | Description |
|---|---|
| `traffic_station` | 교통량 측정 지점 정보 |
| `traffic_volume` | 일시·지점별 교통량 관측 데이터 |
| `weather_observation` | 부산시 기온, 강수량, 습도 등 기상 데이터 |
| `air_quality_observation` | PM10, PM2.5, O3, NO2 등 대기질 데이터 |
| `holiday_calendar` | 날짜별 공휴일 여부 |
| `traffic_feature_dataset` | 모델 학습용 통합 피처 데이터 |
| `model_training_run` | 모델 학습 이력과 성능 지표 |
| `prediction_result` | 예측 결과와 실제값 비교 이력 |

## Relationship Summary

- 하나의 `traffic_station`은 여러 개의 `traffic_volume`을 가진다.
- 하나의 `traffic_station`은 여러 개의 `traffic_feature_dataset` 행과 연결된다.
- 하나의 `model_training_run`은 여러 개의 `prediction_result`를 가진다.
- 하나의 `traffic_station`은 여러 개의 `prediction_result`와 연결된다.
- `traffic_feature_dataset`은 모델 학습을 위해 교통량, 기상, 대기질, 공휴일 변수를 통합한 비정규화 테이블이다.

## Modeling Notes

- 학습용 프로젝트에서는 원천 테이블과 피처 테이블을 모두 둔다.
- 실제 운영 시스템에서는 ETL/ELT 파이프라인과 배치 테이블을 더 세분화할 수 있다.
- 본 프로젝트는 교육용이므로 MySQL 기준으로 작성하되, SQLite 실습에서도 일부 수정하여 사용할 수 있다.
