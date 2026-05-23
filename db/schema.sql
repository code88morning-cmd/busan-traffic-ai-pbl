-- Busan Traffic AI PBL Database Schema
-- Target DBMS: MySQL 8.x

DROP TABLE IF EXISTS prediction_result;
DROP TABLE IF EXISTS model_training_run;
DROP TABLE IF EXISTS traffic_feature_dataset;
DROP TABLE IF EXISTS holiday_calendar;
DROP TABLE IF EXISTS air_quality_observation;
DROP TABLE IF EXISTS weather_observation;
DROP TABLE IF EXISTS traffic_volume;
DROP TABLE IF EXISTS traffic_station;

CREATE TABLE traffic_station (
    station_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    station_name      VARCHAR(100) NOT NULL,
    road_name         VARCHAR(100),
    district_name     VARCHAR(50),
    latitude          DECIMAL(10, 7),
    longitude         DECIMAL(10, 7),
    created_at        DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE traffic_volume (
    traffic_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    station_id         BIGINT NOT NULL,
    observed_datetime  DATETIME NOT NULL,
    observed_date      DATE NOT NULL,
    observed_hour      INT NOT NULL,
    traffic_count      INT NOT NULL,
    direction          VARCHAR(50),
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_traffic_volume_station
        FOREIGN KEY (station_id) REFERENCES traffic_station(station_id)
);

CREATE INDEX idx_traffic_volume_station_datetime
    ON traffic_volume (station_id, observed_datetime);

CREATE TABLE weather_observation (
    weather_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    observed_datetime  DATETIME NOT NULL,
    observed_date      DATE NOT NULL,
    observed_hour      INT NOT NULL,
    temperature        DECIMAL(5, 2),
    precipitation      DECIMAL(6, 2),
    humidity           DECIMAL(5, 2),
    wind_speed         DECIMAL(5, 2),
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_weather_datetime
    ON weather_observation (observed_datetime);

CREATE TABLE air_quality_observation (
    air_quality_id     BIGINT AUTO_INCREMENT PRIMARY KEY,
    observed_datetime  DATETIME NOT NULL,
    observed_date      DATE NOT NULL,
    observed_hour      INT NOT NULL,
    station_name       VARCHAR(100),
    pm10               DECIMAL(6, 2),
    pm25               DECIMAL(6, 2),
    o3                 DECIMAL(6, 4),
    no2                DECIMAL(6, 4),
    co                 DECIMAL(6, 4),
    so2                DECIMAL(6, 4),
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_air_quality_datetime
    ON air_quality_observation (observed_datetime);

CREATE TABLE holiday_calendar (
    holiday_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    holiday_date       DATE NOT NULL UNIQUE,
    holiday_name       VARCHAR(100),
    is_holiday         TINYINT NOT NULL DEFAULT 0,
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE traffic_feature_dataset (
    feature_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    station_id         BIGINT NOT NULL,
    target_datetime    DATETIME NOT NULL,
    target_date        DATE NOT NULL,
    target_hour        INT NOT NULL,
    weekday            INT NOT NULL,
    is_weekend         TINYINT NOT NULL,
    is_holiday         TINYINT NOT NULL,
    temperature        DECIMAL(5, 2),
    precipitation      DECIMAL(6, 2),
    pm10               DECIMAL(6, 2),
    pm25               DECIMAL(6, 2),
    traffic_count      INT NOT NULL,
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_feature_station
        FOREIGN KEY (station_id) REFERENCES traffic_station(station_id)
);

CREATE INDEX idx_feature_station_datetime
    ON traffic_feature_dataset (station_id, target_datetime);

CREATE TABLE model_training_run (
    training_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    model_name         VARCHAR(100) NOT NULL,
    algorithm          VARCHAR(100) NOT NULL,
    train_start_date   DATE,
    train_end_date     DATE,
    mae                DECIMAL(10, 4),
    rmse               DECIMAL(10, 4),
    r2_score           DECIMAL(10, 4),
    model_file_path    VARCHAR(255),
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prediction_result (
    prediction_id       BIGINT AUTO_INCREMENT PRIMARY KEY,
    training_id         BIGINT NOT NULL,
    station_id          BIGINT NOT NULL,
    prediction_datetime DATETIME NOT NULL,
    predicted_traffic   INT NOT NULL,
    actual_traffic      INT,
    error_value         DECIMAL(10, 4),
    created_at          DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_prediction_training
        FOREIGN KEY (training_id) REFERENCES model_training_run(training_id),
    CONSTRAINT fk_prediction_station
        FOREIGN KEY (station_id) REFERENCES traffic_station(station_id)
);

CREATE INDEX idx_prediction_station_datetime
    ON prediction_result (station_id, prediction_datetime);
