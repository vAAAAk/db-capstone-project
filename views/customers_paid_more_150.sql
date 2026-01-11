CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `farouk_elsallak`@`%` 
    SQL SECURITY DEFINER
VIEW `littlelemondb`.`customers_paid_more_150` AS
    SELECT 
        `c`.`customer_id` AS `customer_id`,
        `c`.`customer_name` AS `customer_name`,
        `o`.`order_id` AS `order_id`,
        `o`.`total_cost` AS `total_cost`,
        `m`.`food_name` AS `food_name`,
        `cat`.`category_name` AS `category_name`
    FROM
        (((`littlelemondb`.`orders` `o`
        JOIN `littlelemondb`.`customers` `c` ON ((`c`.`customer_id` = `o`.`customers_customer_id`)))
        JOIN `littlelemondb`.`menus` `m` ON ((`m`.`menu_id` = `o`.`menus_menu_id`)))
        JOIN `littlelemondb`.`categories` `cat` ON ((`cat`.`category_id` = `m`.`categories_category_id`)))
    WHERE
        (`o`.`total_cost` > 150.00)