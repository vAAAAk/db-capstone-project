CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `farouk_elsallak`@`%` 
    SQL SECURITY DEFINER
VIEW `littlelemondb`.`ordersview` AS
    SELECT 
        `o`.`order_id` AS `order_id`,
        `o`.`quantity` AS `quantity`,
        `o`.`total_cost` AS `total_cost`
    FROM
        `littlelemondb`.`orders` `o`
    WHERE
        (`o`.`quantity` > 2)