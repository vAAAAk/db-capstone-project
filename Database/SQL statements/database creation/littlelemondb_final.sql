-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb3 ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(255) NOT NULL,
  `customer_phone` INT NULL DEFAULT NULL,
  `customer_email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`tables` (
  `table_id` INT NOT NULL AUTO_INCREMENT,
  `table_no` INT NOT NULL,
  PRIMARY KEY (`table_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `booking_id` INT NOT NULL,
  `booking_date` DATETIME NOT NULL,
  `table_id` INT NOT NULL,
  `customers_customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `table_id_fk_idx` (`table_id` ASC) VISIBLE,
  INDEX `fk_bookings_customers1_idx` (`customers_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `littlelemondb`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `table_id_fk`
    FOREIGN KEY (`table_id`)
    REFERENCES `littlelemondb`.`tables` (`table_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`cuisines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`cuisines` (
  `cuisine` INT NOT NULL AUTO_INCREMENT,
  `cuisine_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cuisine`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `staff_name` VARCHAR(255) NULL DEFAULT NULL,
  `staff_role` VARCHAR(255) NULL DEFAULT NULL,
  `staff_salary` INT NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menus` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `food_name` VARCHAR(255) NOT NULL,
  `ingredients` TEXT NULL DEFAULT NULL,
  `cuisines_cuisine` INT NOT NULL,
  `categories_category_id` INT NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `fk_menus_cuisines1_idx` (`cuisines_cuisine` ASC) VISIBLE,
  INDEX `fk_menus_categories1_idx` (`categories_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_menus_categories1`
    FOREIGN KEY (`categories_category_id`)
    REFERENCES `littlelemondb`.`categories` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menus_cuisines1`
    FOREIGN KEY (`cuisines_cuisine`)
    REFERENCES `littlelemondb`.`cuisines` (`cuisine`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL DEFAULT NULL,
  `total_cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `order_date` DATETIME NULL DEFAULT NULL,
  `delivery_status_id` INT NOT NULL,
  `menus_menu_id` INT NOT NULL,
  `tables_table_id` INT NOT NULL,
  `customers_customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_menus1_idx` (`menus_menu_id` ASC) VISIBLE,
  INDEX `fk_orders_tables1_idx` (`tables_table_id` ASC) VISIBLE,
  INDEX `fk_orders_customers1_idx` (`customers_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `littlelemondb`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_menus1`
    FOREIGN KEY (`menus_menu_id`)
    REFERENCES `littlelemondb`.`menus` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_tables1`
    FOREIGN KEY (`tables_table_id`)
    REFERENCES `littlelemondb`.`tables` (`table_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`delivery_status` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_date` DATETIME NOT NULL,
  `delivery_state` VARCHAR(255) NOT NULL,
  `orders_order_id` INT NOT NULL,
  `staff_staff_id` INT NOT NULL,
  PRIMARY KEY (`status_id`),
  INDEX `fk_devlivery_status_orders1_idx` (`orders_order_id` ASC) VISIBLE,
  INDEX `fk_delivery_status_staff1_idx` (`staff_staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_status_staff1`
    FOREIGN KEY (`staff_staff_id`)
    REFERENCES `littlelemondb`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_devlivery_status_orders1`
    FOREIGN KEY (`orders_order_id`)
    REFERENCES `littlelemondb`.`orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`customers_paid_more_150`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers_paid_more_150` (`customer_id` INT, `customer_name` INT, `order_id` INT, `total_cost` INT, `food_name` INT, `category_name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`menu_with_more_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu_with_more_orders` (`MenuName` INT);

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`ordersview` (`order_id` INT, `quantity` INT, `total_cost` INT);

-- -----------------------------------------------------
-- procedure AddBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `AddBooking`(IN booking_num INT, IN customer_num INT, IN table_num INT, IN date_booking DATETIME, OUT output_status VARCHAR(255))
BEGIN
	INSERT INTO bookings (booking_id, booking_date, table_id, customers_customer_id)
		VALUE (booking_num, date_booking, table_num, customer_num);
	SET output_status = 'new booking addd';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddValidBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `AddValidBooking`(IN date_check DATETIME, IN table_number INT, IN customer_number INT)
BEGIN
	DECLARE booking_count INT;
    
	START TRANSACTION;
    INSERT INTO bookings (booking_date, table_id, customers_customer_id) VALUES (date_check, table_number, customer_number);
    SELECT COUNT(*) INTO booking_count FROM bookings WHERE booking_date = date_check AND table_id = table_number;
    IF booking_count > 1 THEN 
		ROLLBACK;
		SELECT CONCAT('Table ', table_number,' is already booked - transaction cancelled') AS Status;
	ELSE
		COMMIT;
        SELECT CONCAT('Table ', table_number,' booked successfully - transaction completed') AS Status;  
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `CancelBooking`(IN booking_num INT)
BEGIN
	DELETE FROM bookings WHERE booking_id = booking_num;
    SELECT CONCAT('Booking ', booking_num, ' cancelled');
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `CancelOrder`(in id_order INT)
BEGIN
	DELETE FROM orders WHERE order_id = id_order;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CheckBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `CheckBooking`(IN date_check DATETIME, IN table_number INT)
BEGIN
	SELECT 
		CASE
			WHEN table_id = table_number THEN CONCAT('Table ', table_number,' is already booked')
            ELSE CONCAT('Table ', table_number,' is avaliable')
		END  AS `Booking status`
    FROM bookings
    WHERE booking_date = date_check;		
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
	SELECT o.quantity as `Max Quantity in Order`
    FROM orders as o
    ORDER BY o.quantity DESC
    LIMIT 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`farouk_elsallak`@`%` PROCEDURE `UpdateBooking`(IN booking_num INT, IN date_booking DATETIME)
BEGIN
	UPDATE bookings SET booking_date = date_booking WHERE booking_id = booking_num;
    SELECT CONCAT('Booking ', booking_num, ' updated');
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `littlelemondb`.`customers_paid_more_150`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`customers_paid_more_150`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`farouk_elsallak`@`%` SQL SECURITY DEFINER VIEW `littlelemondb`.`customers_paid_more_150` AS select `c`.`customer_id` AS `customer_id`,`c`.`customer_name` AS `customer_name`,`o`.`order_id` AS `order_id`,`o`.`total_cost` AS `total_cost`,`m`.`food_name` AS `food_name`,`cat`.`category_name` AS `category_name` from (((`littlelemondb`.`orders` `o` join `littlelemondb`.`customers` `c` on((`c`.`customer_id` = `o`.`customers_customer_id`))) join `littlelemondb`.`menus` `m` on((`m`.`menu_id` = `o`.`menus_menu_id`))) join `littlelemondb`.`categories` `cat` on((`cat`.`category_id` = `m`.`categories_category_id`))) where (`o`.`total_cost` > 150.00);

-- -----------------------------------------------------
-- View `littlelemondb`.`menu_with_more_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`menu_with_more_orders`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`farouk_elsallak`@`%` SQL SECURITY DEFINER VIEW `littlelemondb`.`menu_with_more_orders` AS select `m`.`food_name` AS `MenuName` from `littlelemondb`.`menus` `m` where `m`.`menu_id` in (select `o`.`menus_menu_id` from `littlelemondb`.`orders` `o` group by `o`.`menus_menu_id` having (count(`o`.`menus_menu_id`) > 1));

-- -----------------------------------------------------
-- View `littlelemondb`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`ordersview`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`farouk_elsallak`@`%` SQL SECURITY DEFINER VIEW `littlelemondb`.`ordersview` AS select `o`.`order_id` AS `order_id`,`o`.`quantity` AS `quantity`,`o`.`total_cost` AS `total_cost` from `littlelemondb`.`orders` `o` where (`o`.`quantity` > 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
