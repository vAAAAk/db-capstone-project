CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `CancelBooking`(IN booking_num INT)
BEGIN
	DELETE FROM bookings WHERE booking_id = booking_num;
    SELECT CONCAT('Booking ', booking_num, ' cancelled');
END