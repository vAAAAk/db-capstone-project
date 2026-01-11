CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `ManageBooking`(IN id_booking INT, IN date_check DATETIME, IN table_number INT, IN customer_number INT)
BEGIN
	DECLARE booking_count INT;
    
	START TRANSACTION;
    INSERT INTO bookings (booking_id, booking_date, table_id, customers_customer_id) VALUES (id_booking, date_check, table_number, customer_number);
    SELECT COUNT(*) INTO booking_count FROM bookings WHERE booking_date = date_check AND table_id = table_number;
    IF booking_count > 0 THEN 
		ROLLBACK;
		SELECT CONCAT('Table ', table_number,' is already booked - transaction cancelled') AS Status;
	ELSE
		COMMIT;
        SELECT CONCAT('Table ', table_number,' booked successfully - transaction completed') AS Status;  
    END IF;
END