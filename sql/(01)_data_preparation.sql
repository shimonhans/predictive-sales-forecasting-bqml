# Prepare the Time-Series Data
-- my dataset name: crm_predictive_analytics
CREATE OR REPLACE TABLE `crm_predictive_analytics.revenue_time_series` AS
SELECT
  -- 'ds' is the standard column name for the Date Stamp
  CAST(close_date AS DATE) AS ds,
  -- 'y' is the standard column name for the Value we want to predict
  SUM(close_value) AS y
FROM `crm_predictive_analytics.sales_pipeline`
WHERE deal_stage = 'Won'
  AND close_date IS NOT NULL
GROUP BY 1
ORDER BY 1;

