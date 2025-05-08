DELIMITER //
DROP PROCEDURE IF EXISTS this_procedure;
CREATE PROCEDURE this_procedure()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; RESIGNAL; END;
    DECLARE EXIT HANDLER FOR SQLWARNING BEGIN ROLLBACK; RESIGNAL; END;
    DECLARE CONTINUE HANDLER FOR 1091 BEGIN END;
    DECLARE CONTINUE HANDLER FOR 1054 BEGIN END;
    DECLARE EXIT HANDLER FOR 1062 BEGIN ROLLBACK; RESIGNAL; END;
    START TRANSACTION;
        SET foreign_key_checks = 0;
        DROP TABLE IF EXISTS company, company_team, company_structure, company_advanced_customer_entity, company_roles, company_user_roles, company_permissions, company_order_entity, company_credit, company_credit_history, company_payment, company_shipping;
        SET foreign_key_checks = 1;
    COMMIT;
END
//
DELIMITER ;
CALL this_procedure();