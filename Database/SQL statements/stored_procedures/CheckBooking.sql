CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `CheckBooking`(IN date_check DATETIME, IN table_number INT)
BEGIN
	SELECT 
		CASE
			WHEN table_id = table_number THEN CONCAT('Table ', table_number,' is already booked')
            ELSE CONCAT('Table ', table_number,' is avaliable')
		END  AS `Booking status`
    FROM bookings
    WHERE booking_date = date_check;		
END