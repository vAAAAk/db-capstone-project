PREPARE GetOrderDetail FROM 'SELECT order_id, quantity,total_cost AS `Cost` FROM orders WHERE customers_customer_id = ?;';
SET @id=5;
EXECUTE GetOrderDetail USING @id;
DEALLOCATE PREPARE GetOrderDetail;