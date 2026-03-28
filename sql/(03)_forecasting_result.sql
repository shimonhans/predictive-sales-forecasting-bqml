# Step 3: The Big Reveal

SELECT
  -- The future date
  forecast_timestamp,
  -- The 'Middle' (most likely) prediction
  forecast_value,
  -- The 'Pessimistic' scenario (95% confidence lower bound)
  prediction_interval_lower_bound AS pessimistic_forecast,
  -- The 'Optimistic' scenario (95% confidence upper bound)
  prediction_interval_upper_bound AS optimistic_forecast
FROM
  ML.FORECAST(MODEL `crm_predictive_analytics.revenue_forecast_model`,
              STRUCT(90 AS horizon, 0.95 AS confidence_level))
ORDER BY 1;
