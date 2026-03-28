# Creating a BigQuery View for Looker Studio dashboard

CREATE OR REPLACE VIEW `crm_predictive_analytics.v_sales_forecast_dashboard` AS
-- Part A: Get the Historical actuals
SELECT
  ds AS report_date,
  'Actual' AS data_type,
  y AS actual_revenue,
  NULL AS forecast_revenue,
  NULL AS lower_bound,
  NULL AS upper_bound
FROM `crm_predictive_analytics.revenue_time_series`

UNION ALL
-- Part B: Get the Future Predictions
SELECT
  CAST(forecast_timestamp AS DATE) AS report_date,
  'Forecast' AS data_type,
  NULL AS actual_revenue,
  forecast_value AS forecast_revenue,
  prediction_interval_lower_bound AS lower_bound,
  prediction_interval_upper_bound AS upper_bound
FROM
  ML.FORECAST(MODEL `crm_predictive_analytics.revenue_forecast_model`,
              STRUCT(90 AS horizon, 0.95 AS confidence_level));

