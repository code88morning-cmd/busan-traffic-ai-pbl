-- Sample seed data for Busan Traffic AI PBL

INSERT INTO traffic_station (station_name, road_name, district_name, latitude, longitude) VALUES
('해운대해변로_센텀방향', '해운대해변로', '해운대구', 35.1587, 129.1604),
('광안대교_남천방향', '광안대교', '수영구', 35.1532, 129.1187),
('부산역_중앙대로', '중앙대로', '동구', 35.1151, 129.0415),
('서면_중앙대로', '중앙대로', '부산진구', 35.1579, 129.0592),
('부산항_충장대로', '충장대로', '동구', 35.1064, 129.0406);

INSERT INTO traffic_volume (station_id, observed_datetime, observed_date, observed_hour, traffic_count, direction) VALUES
(1, '2025-07-01 08:00:00', '2025-07-01', 8, 18420, '센텀방향'),
(1, '2025-07-01 18:00:00', '2025-07-01', 18, 22400, '해운대방향'),
(2, '2025-07-01 08:00:00', '2025-07-01', 8, 15600, '남천방향'),
(3, '2025-07-01 08:00:00', '2025-07-01', 8, 13250, '서면방향'),
(4, '2025-07-01 18:00:00', '2025-07-01', 18, 20500, '부산역방향');

INSERT INTO weather_observation (observed_datetime, observed_date, observed_hour, temperature, precipitation, humidity, wind_speed) VALUES
('2025-07-01 08:00:00', '2025-07-01', 8, 25.30, 0.00, 70.00, 2.10),
('2025-07-01 18:00:00', '2025-07-01', 18, 28.10, 1.20, 76.00, 3.20);

INSERT INTO air_quality_observation (observed_datetime, observed_date, observed_hour, station_name, pm10, pm25, o3, no2, co, so2) VALUES
('2025-07-01 08:00:00', '2025-07-01', 8, '해운대구', 32.0, 18.0, 0.0310, 0.0210, 0.5000, 0.0030),
('2025-07-01 18:00:00', '2025-07-01', 18, '해운대구', 36.0, 20.0, 0.0380, 0.0240, 0.5200, 0.0030);

INSERT INTO holiday_calendar (holiday_date, holiday_name, is_holiday) VALUES
('2025-01-01', '신정', 1),
('2025-03-01', '삼일절', 1),
('2025-07-01', NULL, 0);

INSERT INTO traffic_feature_dataset (
    station_id, target_datetime, target_date, target_hour, weekday,
    is_weekend, is_holiday, temperature, precipitation, pm10, pm25, traffic_count
) VALUES
(1, '2025-07-01 08:00:00', '2025-07-01', 8, 1, 0, 0, 25.30, 0.00, 32.00, 18.00, 18420),
(1, '2025-07-01 18:00:00', '2025-07-01', 18, 1, 0, 0, 28.10, 1.20, 36.00, 20.00, 22400);

INSERT INTO model_training_run (
    model_name, algorithm, train_start_date, train_end_date,
    mae, rmse, r2_score, model_file_path
) VALUES
('baseline_random_forest', 'RandomForestRegressor', '2025-01-01', '2025-07-01', 874.3000, 1245.6000, 0.8920, 'models/busan_traffic_model.joblib');

INSERT INTO prediction_result (
    training_id, station_id, prediction_datetime,
    predicted_traffic, actual_traffic, error_value
) VALUES
(1, 1, '2025-07-01 08:00:00', 18100, 18420, 320.0000),
(1, 1, '2025-07-01 18:00:00', 21800, 22400, 600.0000);
