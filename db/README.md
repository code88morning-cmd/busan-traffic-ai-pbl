# Database

본 폴더는 부산시 교통량 예측 AI PBL 프로젝트의 DB 산출물을 보관합니다.

## Files

| File | Description |
|---|---|
| `schema.sql` | MySQL 기준 테이블 생성 스크립트 |
| `seed.sql` | 테스트용 샘플 데이터 |

## Setup

```bash
mysql -u root -p
```

```sql
CREATE DATABASE busan_traffic_ai_pbl DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE busan_traffic_ai_pbl;
SOURCE db/schema.sql;
SOURCE db/seed.sql;
```

## Notes

- 실제 공공데이터 적재 전까지는 `seed.sql`로 테스트합니다.
- SQLite로 실습할 경우 `AUTO_INCREMENT`, `DATETIME`, `DECIMAL` 타입 일부를 SQLite 문법에 맞게 조정해야 합니다.
