from pathlib import Path
import os

PROJECT_ROOT = Path(__file__).resolve().parents[1]
DATA_DIR = PROJECT_ROOT / "data"
RAW_DIR = DATA_DIR / "raw"
PROCESSED_DIR = DATA_DIR / "processed"
MODEL_DIR = PROJECT_ROOT / "models"

# 공공데이터포털 인증키는 코드에 직접 쓰지 말고 환경변수로 관리한다.
DATA_GO_KR_SERVICE_KEY = os.getenv("DATA_GO_KR_SERVICE_KEY", "")

# 기상청 단기예보 격자 좌표: 부산광역시 대표값. 실제 프로젝트에서는 분석 구·동 기준으로 재확인한다.
BUSAN_NX = 98
BUSAN_NY = 76

DEFAULT_X_PATH = PROCESSED_DIR / "merged_x.csv"
DEFAULT_Y_PATH = PROCESSED_DIR / "traffic_daily_total_2022_2023.csv"
