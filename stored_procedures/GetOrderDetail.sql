CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `GetOrderDetail`(IN customer_id INT)
BEGIN
	SELECT 
		order_id, 
        quantity,
        total_cost AS `Cost`
    FROM orders
    WHERE customers_customer_id = customer_id;
END