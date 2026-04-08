-- SUPPLY CHAIN ANALYSIS: 

-- 1. Profit and margin per SKU
SELECT 
    sku,
    SUM(revenue) AS revenue,
    SUM(total_cost) AS cost,
    SUM(revenue - total_cost) AS profit,
    ROUND((SUM(revenue - total_cost) / SUM(revenue)) * 100, 2) AS profit_margin
FROM supply_chain
GROUP BY sku
ORDER BY profit DESC;


-- 2. Top loss-making SKUs
SELECT 
    sku,
    revenue - total_cost AS profit
FROM supply_chain
ORDER BY profit ASC
LIMIT 10;


-- 3. Supplier performance (profit, defects, lead time)
SELECT 
    supplier_name,
    AVG(defect_rate) AS avg_defect_rate,
    AVG(lead_time) AS avg_lead_time,
    SUM(revenue - total_cost) AS total_profit
FROM supply_chain
GROUP BY supplier_name
ORDER BY avg_defect_rate ASC, total_profit DESC;


-- 4. Defect-adjusted revenue
SELECT 
    sku,
    SUM(revenue) AS total_revenue,
    SUM(revenue * defect_rate) AS defect_loss,
    SUM(revenue * (1 - defect_rate)) AS effective_revenue
FROM supply_chain
GROUP BY sku
ORDER BY effective_revenue DESC;


-- 5. Effective profit after defect impact
SELECT 
    sku,
    SUM((revenue * (1 - defect_rate)) - total_cost) AS effective_profit
FROM supply_chain
GROUP BY sku
ORDER BY effective_profit DESC;


-- 6. Cost leakage (high cost-to-revenue ratio)
SELECT 
    sku,
    revenue,
    total_cost,
    (total_cost / revenue) AS cost_ratio
FROM supply_chain
WHERE (total_cost / revenue) > 0.7
ORDER BY cost_ratio DESC;


-- 7. Inventory pressure (demand vs stock)
SELECT 
    sku,
    stock_levels,
    products_sold,
    (products_sold / stock_levels) AS demand_pressure
FROM supply_chain
WHERE stock_levels > 0
ORDER BY demand_pressure DESC;


-- 8. Logistics efficiency by transport mode
SELECT 
    transport_mode,
    AVG(shipping_time) AS avg_time,
    AVG(shipping_cost) AS avg_cost,
    SUM(revenue) AS total_revenue
FROM supply_chain
GROUP BY transport_mode
ORDER BY avg_time;


-- 9. High demand with high defect rate
SELECT 
    sku,
    products_sold,
    defect_rate
FROM supply_chain
WHERE products_sold > 500
  AND defect_rate > 0.5
ORDER BY defect_rate DESC;


-- 10. complete business value
SELECT 
    sku,
    ((revenue * (1 - defect_rate)) - total_cost) AS complete_business_value
FROM supply_chain
ORDER BY complete_business_value DESC;