CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
	SELECT o.quantity as `Max Quantity in Order`
    FROM orders as o
    ORDER BY o.quantity DESC
    LIMIT 1;
END