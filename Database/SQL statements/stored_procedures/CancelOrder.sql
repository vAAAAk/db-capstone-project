CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `CancelOrder`(in id_order INT)
BEGIN
	DELETE FROM orders WHERE order_id = id_order;
END