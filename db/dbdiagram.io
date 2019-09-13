Table "protocol_records" {
  "id" varchar
  "user_id" integer
  "protocols_id" integer
  "records_id" integer
  "created_at" datetime
  "updated_at" datetime
}

Table "protocols" {
  "id" varchar
  "name" string
  "description" string
  "created_at" datetime
  "updated_at" datetime
}

Table "records" {
  "id" varchar
  "resting_heartrate" integer
  "bp_over" integer
  "bp_under" integer
  "mood_score" integer
  "exercise_minutes" integer
  "water_unit" string
  "water_consumed" integer
  "created_at" datetime
  "updated_at" datetime
}

Table "users" {
  "id" varchar
  "username" string
  "email" string
  "password_digest" string
  "created_at" datetime
  "updated_at" datetime
}

Ref "fk_rails_protocol_records_users":"protocol_records"."user_id" < "users"."id"
Ref "fk_rails_protocol_records_users":"protocol_records"."protocols_id" < "protocols"."id"
Ref "fk_rails_protocol_records_users":"protocol_records"."records_id" < "records"."id"
