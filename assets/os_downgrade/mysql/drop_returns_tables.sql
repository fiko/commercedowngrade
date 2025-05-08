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
        DROP TABLE IF EXISTS magento_rma, magento_rma_grid, magento_rma_status_history, magento_rma_item_entity, magento_rma_item_eav_attribute, magento_rma_item_entity_datetime, magento_rma_item_entity_decimal, magento_rma_item_entity_int, magento_rma_item_entity_text, magento_rma_item_entity_varchar, magento_rma_item_form_attribute, magento_rma_item_eav_attribute_website, magento_rma_shipping_label;
        SET foreign_key_checks = 1;
    COMMIT;
END
//
DELIMITER ;
CALL this_procedure();