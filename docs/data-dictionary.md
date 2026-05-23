# Data Dictionary

## traffic_station

| Column | Type | Key | Description |
|---|---|---|---|
| station_id | BIGINT | PK | 교통량 측정 지점 ID |
| station_name | VARCHAR(100) |  | 측정 지점명 |
| road_name | VARCHAR(100) |  | 도로명 |
| district_name | VARCHAR(50) |  | 구·군명 |
| latitude | DECIMAL(10,7) |  | 위도 |
| longitude | DECIMAL(10,7) |  | 경도 |
| created_at | DATETIME |  | 생성일시 |

## traffic_volume

| Column | Type | Key | Description |
|---|---|---|---|
| traffic_id | BIGINT | PK | 교통량 관측 ID |
| station_id | BIGINT | FK | 측정 지점 ID |
| observed_datetime | DATETIME |  | 관측 일시 |
| observed_date | DATE |  | 관측 날짜 |
| observed_hour | INT |  | 관측 시간 |
| traffic_count | INT |  | 교통량 |
| direction | VARCHAR(50) |  | 진행 방향 |
| created_at | DATETIME |  | 생성일시 |

## weather_observation

| Column | Type | Key | Description |
|---|---|---|---|
| weather_id | BIGINT | PK | 기상 관측 ID |
| observed_datetime | DATETIME |  | 관측 일시 |
| observed_date | DATE |  | 관측 날짜 |
| observed_hour | INT |  | 관측 시간 |
| temperature | DECIMAL(5,2) |  | 기온 |
| precipitation | DECIMAL(6,2) |  | 강수량 |
| humidity | DECIMAL(5,2) |  | 습도 |
| wind_speed | DECIMAL(5,2) |  | 풍속 |
| created_at | DATETIME |  | 생성일시 |

## air_quality_observation

| Column | Type | Key | Description |
|---|---|---|---|
| air_quality_id | BIGINT | PK | 대기질 관측 ID |
| observed_datetime | DATETIME |  | 관측 일시 |
| observed_date | DATE |  | 관측 날짜 |
| observed_hour | INT |  | 관측 시간 |
| station_name | VARCHAR(100) |  | 대기질 측정소명 |
| pm10 | DECIMAL(6,2) |  | 미세먼지 |
| pm25 | DECIMAL(6,2) |  | 초미세먼지 |
| o3 | DECIMAL(6,4) |  | 오존 |
| no2 | DECIMAL(6,4) |  | 이산화질소 |
| co | DECIMAL(6,4) |  | 일산화탄소 |
| so2 | DECIMAL(6,4) |  | 아황산가스 |
| created_at | DATETIME |  | 생성일시 |

## holiday_calendar

| Column | Type | Key | Description |
|---|---|---|---|
| holiday_id | BIGINT | PK | 공휴일 ID |
| holiday_date | DATE | UK | 날짜 |
| holiday_name | VARCHAR(100) |  | 공휴일명 |
| is_holiday | TINYINT |  | 공휴일 여부, 1 또는 0 |
| created_at | DATETIME |  | 생성일시 |

## traffic_feature_dataset

| Column | Type | Key | Description |
|---|---|---|---|
| feature_id | BIGINT | PK | 피처 데이터 ID |
| station_id | BIGINT | FK | 측정 지점 ID |
| target_datetime | DATETIME |  | 예측 대상 일시 |
| target_date | DATE |  | 예측 대상 날짜 |
| target_hour | INT |  | 예측 대상 시간 |
| weekday | INT |  | 요일, 0~6 |
| is_weekend | TINYINT |  | 주말 여부 |
| is_holiday | TINYINT |  | 공휴일 여부 |
| temperature | DECIMAL(5,2) |  | 기온 |
| precipitation | DECIMAL(6,2) |  | 강수량 |
| pm10 | DECIMAL(6,2) |  | 미세먼지 |
| pm25 | DECIMAL(6,2) |  | 초미세먼지 |
| traffic_count | INT |  | 예측 대상 교통량 |
| created_at | DATETIME |  | 생성일시 |

## model_training_run

| Column | Type | Key | Description |
|---|---|---|---|
| training_id | BIGINT | PK | 학습 실행 ID |
| model_name | VARCHAR(100) |  | 모델명 |
| algorithm | VARCHAR(100) |  | 알고리즘 |
| train_start_date | DATE |  | 학습 시작일 |
| train_end_date | DATE |  | 학습 종료일 |
| mae | DECIMAL(10,4) |  | MAE |
| rmse | DECIMAL(10,4) |  | RMSE |
| r2_score | DECIMAL(10,4) |  | R² |
| model_file_path | VARCHAR(255) |  | 모델 파일 경로 |
| created_at | DATETIME |  | 생성일시 |

## prediction_result

| Column | Type | Key | Description |
|---|---|---|---|
| prediction_id | BIGINT | PK | 예측 결과 ID |
| training_id | BIGINT | FK | 학습 실행 ID |
| station_id | BIGINT | FK | 측정 지점 ID |
| prediction_datetime | DATETIME |  | 예측 대상 일시 |
| predicted_traffic | INT |  | 예측 교통량 |
| actual_traffic | INT |  | 실제 교통량 |
| error_value | DECIMAL(10,4) |  | 예측 오차 |
| created_at | DATETIME |  | 생성일시 |
