CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `farouk_elsallak`@`%` 
    SQL SECURITY DEFINER
VIEW `littlelemondb`.`menu_with_more_orders` AS
    SELECT 
        `m`.`food_name` AS `MenuName`
    FROM
        `littlelemondb`.`menus` `m`
    WHERE
        `m`.`menu_id` IN (SELECT 
                `o`.`menus_menu_id`
            FROM
                `littlelemondb`.`orders` `o`
            GROUP BY `o`.`menus_menu_id`
            HAVING (COUNT(`o`.`menus_menu_id`) > 1))