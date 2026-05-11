-- Migration: Add error log table for tracking account fallback errors
CREATE TABLE IF NOT EXISTS error_log (
  id TEXT PRIMARY KEY,
  timestamp TEXT NOT NULL,
  endpoint TEXT NOT NULL,
  model TEXT NOT NULL,
  status INTEGER NOT NULL,
  account_login TEXT NOT NULL,
  api_key_id TEXT,
  error_body TEXT
);

CREATE INDEX IF NOT EXISTS idx_error_log_timestamp ON error_log (timestamp);
