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
        INSERT INTO
            amasty_rma_request
        SELECT
            MAX(magento_rma.entity_id),
            magento_rma.order_id,
            IFNULL(magento_rma.store_id, 0),
            magento_rma.date_requested,
            magento_rma.date_requested,
            11,
            IFNULL(magento_rma.customer_id, 0),
            IFNULL(magento_rma_grid.customer_name, 0),
            0,
            0,
            0,
            0,
            NULL,
            IFNULL(magento_rma_item_entity_text.value, NULL),
            NULL
        FROM
            magento_rma
        LEFT JOIN 
            magento_rma_grid
            ON
                magento_rma.entity_id = magento_rma_grid.entity_id
        LEFT JOIN 
             magento_rma_item_entity
            ON
                magento_rma.entity_id = magento_rma_item_entity.rma_entity_id
        LEFT JOIN
            magento_rma_item_entity_text
            ON
                magento_rma_item_entity.entity_id = magento_rma_item_entity_text.entity_id
            AND
                magento_rma_item_entity_text.attribute_id = 1397
        GROUP BY magento_rma_item_entity.rma_entity_id;
        INSERT INTO
            amasty_rma_request_item
        SELECT
            NULL,
            magento_rma_item_entity.rma_entity_id,
            magento_rma_item_entity.order_item_id,
            magento_rma_item_entity.qty_authorized,
            magento_rma_item_entity.qty_requested,
            0,
            0,
            0,
            0
        FROM
             magento_rma_item_entity;
        SET foreign_key_checks = 1;
    COMMIT;
END
//
DELIMITER ;
CALL this_procedure();