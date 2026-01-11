CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `UpdateBooking`(IN booking_num INT, IN date_booking DATETIME)
BEGIN
	UPDATE bookings SET booking_date = date_booking WHERE booking_id = booking_num;
    SELECT CONCAT('Booking ', booking_num, ' updated');
END