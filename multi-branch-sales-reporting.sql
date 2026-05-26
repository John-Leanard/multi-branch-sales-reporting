SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT 
    b.branch_id,
    b.branch_name,
    b.region,
    COUNT(s.sales_id) AS total_transactions,
    SUM(s.total_amount) AS gross_revenue,
    AVG(s.total_amount) AS average_ticket_size
FROM dim_branches b
LEFT JOIN fact_sales s ON b.branch_id = s.branch_id
WHERE s.transaction_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
  AND EXISTS (
      SELECT 1 
      FROM inventory_status i 
      WHERE i.branch_id = b.branch_id 
        AND i.is_active = 1
  )
GROUP BY b.branch_id, b.branch_name, b.region
ORDER BY gross_revenue DESC;
