CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `AddBooking`(IN booking_num INT, IN customer_num INT, IN table_num INT, IN date_booking DATETIME, OUT output_status VARCHAR(255))
BEGIN
	INSERT INTO bookings (booking_id, booking_date, table_id, customers_customer_id)
		VALUE (booking_num, date_booking, table_num, customer_num);
	SET output_status = 'new booking addd';
END