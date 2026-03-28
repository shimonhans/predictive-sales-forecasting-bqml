# Training the Revenue Forecast
-- We are going to tell the model to look at the history and project 90 days into the future.

CREATE OR REPLACE MODEL `crm_predictive_analytics.revenue_forecast_model`
OPTIONS(
  -- ARIMA_PLUS is BigQuery's dedicated time-series engine
  model_type = 'ARIMA_PLUS',
  -- We point it to our standardized column names
  time_series_timestamp_col = 'ds',
  time_series_data_col = 'y',
  -- HORIZON = 90 tells the model to predict the next 3 months
  horizon = 90,
  -- AUTO_ARIMA lets BigQuery pick the best mathematical settings for you
  auto_arima = TRUE
) AS
SELECT
  ds,
  y
FROM
  `crm_predictive_analytics.revenue_time_series`;
