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
        SET FOREIGN_KEY_CHECKS=0;
        ALTER TABLE `adminnotification_inbox`
            DROP COLUMN `is_amasty`,
            DROP COLUMN `expiration_date`,
            DROP COLUMN `image_url`;
        ALTER TABLE `authorization_role`
            DROP COLUMN `gws_is_all`,
            DROP COLUMN `gws_websites`,
            DROP COLUMN `gws_store_groups`;
        ALTER TABLE `catalog_category_entity`
            DROP COLUMN `entity_id`,
            DROP COLUMN `created_in`,
            DROP COLUMN `updated_in`,
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`entity_id`),
            DROP KEY `CATALOG_CATEGORY_ENTITY_CREATED_IN`,
            DROP KEY `CATALOG_CATEGORY_ENTITY_UPDATED_IN`,
            DROP KEY `CATALOG_CATEGORY_ENTITY_ENTITY_ID`;
        ALTER TABLE `catalog_category_entity_datetime`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_CATEGORY_ENTITY_DATETIME_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
            DROP KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ROW_ID`,
            ADD KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`);
        ALTER TABLE `catalog_category_entity_decimal`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_CATEGORY_ENTITY_DECIMAL_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
            DROP KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ROW_ID`,
            ADD KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`);
        ALTER TABLE `catalog_category_entity_int`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_CATEGORY_ENTITY_INT_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
            DROP KEY `CATALOG_CATEGORY_ENTITY_INT_ROW_ID`,
            ADD KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`);
        ALTER TABLE `catalog_category_entity_text`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_CATEGORY_ENTITY_TEXT_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
            DROP KEY `CATALOG_CATEGORY_ENTITY_TEXT_ROW_ID`,
            ADD KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`);
        ALTER TABLE `catalog_category_entity_varchar`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_CATEGORY_ENTITY_VARCHAR_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
            DROP KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ROW_ID`,
            ADD KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`);
        ALTER TABLE `catalog_eav_attribute`
            DROP COLUMN `is_pagebuilder_enabled`;
        ALTER TABLE `catalog_product_bundle_option`
            CHANGE `option_id` `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`option_id`,`parent_id`);
        ALTER TABLE `catalog_product_bundle_option_value`
            DROP KEY `CAT_PRD_BNDL_OPT_VAL_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`;
        ALTER TABLE `catalog_product_bundle_selection`
            CHANGE `selection_id` `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection ID',
            CHANGE `parent_product_id` `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`selection_id`),
            DROP KEY `CAT_PRD_BNDL_SELECTION_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`;
        ALTER TABLE `catalog_product_bundle_selection_price`
            DROP KEY `CAT_PRD_BNDL_SELECTION_PRICE_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID`;
        ALTER TABLE `catalog_product_entity`
            DROP COLUMN `entity_id`,
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
            DROP COLUMN `created_in`,
            DROP COLUMN `updated_in`,
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`entity_id`),
            DROP KEY `CATALOG_PRODUCT_ENTITY_CREATED_IN`,
            DROP KEY `CATALOG_PRODUCT_ENTITY_UPDATED_IN`,
            DROP KEY `CATALOG_PRODUCT_ENTITY_ENTITY_ID_CREATED_IN_UPDATED_IN`;
        ALTER TABLE `catalog_product_entity_datetime`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_PRODUCT_ENTITY_DATETIME_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`);
        ALTER TABLE `catalog_product_entity_decimal`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_PRODUCT_ENTITY_DECIMAL_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`);
        ALTER TABLE `catalog_product_entity_gallery`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_PRODUCT_ENTITY_GALLERY_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
            DROP KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ROW_ID`,
            ADD KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`);
        ALTER TABLE `catalog_product_entity_int`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_PRODUCT_ENTITY_INT_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`);
        ALTER TABLE `catalog_product_entity_media_gallery_value`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ROW_ID`,
            ADD KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
            DROP KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ROW_ID_VAL_ID_STORE_ID`,
            ADD KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_VAL_ID_STORE_ID` (`entity_id`,`value_id`,`store_id`);
        ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity`
            CHANGE `row_id` `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'Product Entity ID',
            DROP INDEX `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ROW_ID_CAT_PRD_ENTT_ROW_ID`,
            ADD UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`, `entity_id`),
            ADD KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`);
        ALTER TABLE `catalog_product_entity_text`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_PRODUCT_ENTITY_TEXT_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`);
        ALTER TABLE `catalog_product_entity_tier_price`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `UNQ_EBC6A54F44DFA66FA9024CAD97FED6C7`,
            ADD UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`);
        ALTER TABLE `catalog_product_entity_varchar`
            CHANGE `row_id` `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
            DROP INDEX `CATALOG_PRODUCT_ENTITY_VARCHAR_ROW_ID_ATTRIBUTE_ID_STORE_ID`,
            ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`);
        ALTER TABLE `cataloginventory_stock_item`
            DROP COLUMN `deferred_stock_update`,
            DROP COLUMN `use_config_deferred_stock_update`;
        ALTER TABLE `catalogrule`
            DROP COLUMN `rule_id`,
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
            DROP COLUMN `created_in`,
            DROP COLUMN `updated_in`,
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`rule_id`),
            DROP KEY `CATALOGRULE_CREATED_IN`,
            DROP KEY `CATALOGRULE_UPDATED_IN`,
            DROP KEY `CATALOGRULE_RULE_ID`;
        ALTER TABLE `catalogrule_customer_group`
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`rule_id`,`customer_group_id`);
        ALTER TABLE `catalogrule_website`
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`rule_id`,`website_id`);
        ALTER TABLE `cms_block`
            DROP COLUMN `block_id`,
            CHANGE `row_id` `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
            DROP COLUMN `created_in`,
            DROP COLUMN `updated_in`,
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`block_id`),
            DROP KEY `CMS_BLOCK_CREATED_IN`,
            DROP KEY `CMS_BLOCK_UPDATED_IN`,
            DROP KEY `CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE`;
        ALTER TABLE `cms_block_store`
            CHANGE `row_id` `block_id` smallint(6) NOT NULL,
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`block_id`,`store_id`);
        ALTER TABLE `cms_page`
            DROP COLUMN `page_id`,
            CHANGE `row_id` `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
            DROP COLUMN `created_in`,
            DROP COLUMN `updated_in`,
            DROP COLUMN `website_root`,
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`page_id`),
            DROP KEY `CMS_PAGE_CREATED_IN`,
            DROP KEY `CMS_PAGE_UPDATED_IN`,
            DROP KEY `CMS_PAGE_PAGE_ID`;
        ALTER TABLE `cms_page_store`
            CHANGE `row_id` `page_id` smallint(6) NOT NULL COMMENT 'Entity ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`page_id`,`store_id`);
        ALTER TABLE `customer_eav_attribute`
            DROP COLUMN `is_used_for_customer_segment`;
        ALTER TABLE `customer_entity`
            DROP KEY `CUSTOMER_ENTITY_CREATED_AT`,
            DROP KEY `CUSTOMER_ENTITY_DOB`,
            DROP KEY `CUSTOMER_ENTITY_DEFAULT_BILLING`,
            DROP KEY `CUSTOMER_ENTITY_DEFAULT_SHIPPING`,
            DROP KEY `CUSTOMER_ENTITY_GENDER`,
            DROP KEY `CUSTOMER_ENTITY_GROUP_ID`;
        ALTER TABLE `email_contact`
            CHANGE `last_subscribed_at` `last_subscribed_at` timestamp NULL DEFAULT NULL COMMENT 'Last subscribed date';
        ALTER TABLE `klarna_payments_quote`
            DROP KEY `KLARNA_PAYMENTS_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID`;
        ALTER TABLE `quote`
            DROP COLUMN `customer_balance_amount_used`,
            DROP COLUMN `base_customer_bal_amount_used`,
            DROP COLUMN `use_customer_balance`,
            DROP COLUMN `gift_cards`,
            DROP COLUMN `gift_cards_amount`,
            DROP COLUMN `base_gift_cards_amount`,
            DROP COLUMN `gift_cards_amount_used`,
            DROP COLUMN `base_gift_cards_amount_used`,
            DROP COLUMN `gift_message_id`,
            DROP COLUMN `gw_id`,
            DROP COLUMN `gw_allow_gift_receipt`,
            DROP COLUMN `gw_add_card`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_items_base_price`,
            DROP COLUMN `gw_items_price`,
            DROP COLUMN `gw_card_base_price`,
            DROP COLUMN `gw_card_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`,
            DROP COLUMN `gw_items_base_tax_amount`,
            DROP COLUMN `gw_items_tax_amount`,
            DROP COLUMN `gw_card_base_tax_amount`,
            DROP COLUMN `gw_card_tax_amount`,
            DROP COLUMN `gw_base_price_incl_tax`,
            DROP COLUMN `gw_price_incl_tax`,
            DROP COLUMN `gw_items_base_price_incl_tax`,
            DROP COLUMN `gw_items_price_incl_tax`,
            DROP COLUMN `gw_card_base_price_incl_tax`,
            DROP COLUMN `gw_card_price_incl_tax`,
            DROP COLUMN `use_reward_points`,
            DROP COLUMN `reward_points_balance`,
            DROP COLUMN `base_reward_currency_amount`,
            DROP COLUMN `reward_currency_amount`;
        ALTER TABLE `quote_address`
            DROP COLUMN `base_customer_balance_amount`,
            DROP COLUMN `customer_balance_amount`,
            DROP COLUMN `gift_cards_amount`,
            DROP COLUMN `base_gift_cards_amount`,
            DROP COLUMN `gift_cards`,
            DROP COLUMN `used_gift_cards`,
            DROP COLUMN `gw_id`,
            DROP COLUMN `gw_allow_gift_receipt`,
            DROP COLUMN `gw_add_card`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_items_base_price`,
            DROP COLUMN `gw_items_price`,
            DROP COLUMN `gw_card_base_price`,
            DROP COLUMN `gw_card_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`,
            DROP COLUMN `gw_items_base_tax_amount`,
            DROP COLUMN `gw_items_tax_amount`,
            DROP COLUMN `gw_card_base_tax_amount`,
            DROP COLUMN `gw_card_tax_amount`,
            DROP COLUMN `gw_base_price_incl_tax`,
            DROP COLUMN `gw_price_incl_tax`,
            DROP COLUMN `gw_items_base_price_incl_tax`,
            DROP COLUMN `gw_items_price_incl_tax`,
            DROP COLUMN `gw_card_base_price_incl_tax`,
            DROP COLUMN `gw_card_price_incl_tax`,
            DROP COLUMN `giftregistry_item_id`,
            DROP COLUMN `reward_points_balance`,
            DROP COLUMN `base_reward_currency_amount`,
            DROP COLUMN `reward_currency_amount`;
        ALTER TABLE `quote_address_item`
            DROP COLUMN `gw_id`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`;
        ALTER TABLE `quote_item`
            DROP COLUMN `gw_id`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`,
            DROP COLUMN `event_id`,
            DROP COLUMN `giftregistry_item_id`;
        ALTER TABLE `sales_creditmemo`
            DROP COLUMN `base_customer_balance_amount`,
            DROP COLUMN `customer_balance_amount`,
            DROP COLUMN `bs_customer_bal_total_refunded`,
            DROP COLUMN `customer_bal_total_refunded`,
            DROP COLUMN `base_gift_cards_amount`,
            DROP COLUMN `gift_cards_amount`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_items_base_price`,
            DROP COLUMN `gw_items_price`,
            DROP COLUMN `gw_card_base_price`,
            DROP COLUMN `gw_card_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`,
            DROP COLUMN `gw_items_base_tax_amount`,
            DROP COLUMN `gw_items_tax_amount`,
            DROP COLUMN `gw_card_base_tax_amount`,
            DROP COLUMN `gw_card_tax_amount`,
            DROP COLUMN `base_reward_currency_amount`,
            DROP COLUMN `reward_currency_amount`,
            DROP COLUMN `reward_points_balance`,
            DROP COLUMN `reward_points_balance_refund`;
        ALTER TABLE `sales_invoice`
            DROP COLUMN `base_customer_balance_amount`,
            DROP COLUMN `customer_balance_amount`,
            DROP COLUMN `base_gift_cards_amount`,
            DROP COLUMN `gift_cards_amount`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_items_base_price`,
            DROP COLUMN `gw_items_price`,
            DROP COLUMN `gw_card_base_price`,
            DROP COLUMN `gw_card_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`,
            DROP COLUMN `gw_items_base_tax_amount`,
            DROP COLUMN `gw_items_tax_amount`,
            DROP COLUMN `gw_card_base_tax_amount`,
            DROP COLUMN `gw_card_tax_amount`,
            DROP COLUMN `base_reward_currency_amount`,
            DROP COLUMN `reward_currency_amount`,
            DROP COLUMN `reward_points_balance`;
        ALTER TABLE `sales_order`
            DROP COLUMN `base_customer_balance_amount`,
            DROP COLUMN `customer_balance_amount`,
            DROP COLUMN `base_customer_balance_invoiced`,
            DROP COLUMN `customer_balance_invoiced`,
            DROP COLUMN `base_customer_balance_refunded`,
            DROP COLUMN `customer_balance_refunded`,
            DROP COLUMN `bs_customer_bal_total_refunded`,
            DROP COLUMN `customer_bal_total_refunded`,
            DROP COLUMN `gift_cards`,
            DROP COLUMN `base_gift_cards_amount`,
            DROP COLUMN `gift_cards_amount`,
            DROP COLUMN `base_gift_cards_invoiced`,
            DROP COLUMN `gift_cards_invoiced`,
            DROP COLUMN `base_gift_cards_refunded`,
            DROP COLUMN `gift_cards_refunded`,
            DROP COLUMN `gw_id`,
            DROP COLUMN `gw_allow_gift_receipt`,
            DROP COLUMN `gw_add_card`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_items_base_price`,
            DROP COLUMN `gw_items_price`,
            DROP COLUMN `gw_card_base_price`,
            DROP COLUMN `gw_card_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`,
            DROP COLUMN `gw_items_base_tax_amount`,
            DROP COLUMN `gw_items_tax_amount`,
            DROP COLUMN `gw_card_base_tax_amount`,
            DROP COLUMN `gw_card_tax_amount`,
            DROP COLUMN `gw_base_price_incl_tax`,
            DROP COLUMN `gw_price_incl_tax`,
            DROP COLUMN `gw_items_base_price_incl_tax`,
            DROP COLUMN `gw_items_price_incl_tax`,
            DROP COLUMN `gw_card_base_price_incl_tax`,
            DROP COLUMN `gw_card_price_incl_tax`,
            DROP COLUMN `gw_base_price_invoiced`,
            DROP COLUMN `gw_price_invoiced`,
            DROP COLUMN `gw_items_base_price_invoiced`,
            DROP COLUMN `gw_items_price_invoiced`,
            DROP COLUMN `gw_card_base_price_invoiced`,
            DROP COLUMN `gw_card_price_invoiced`,
            DROP COLUMN `gw_base_tax_amount_invoiced`,
            DROP COLUMN `gw_tax_amount_invoiced`,
            DROP COLUMN `gw_items_base_tax_invoiced`,
            DROP COLUMN `gw_items_tax_invoiced`,
            DROP COLUMN `gw_card_base_tax_invoiced`,
            DROP COLUMN `gw_card_tax_invoiced`,
            DROP COLUMN `gw_base_price_refunded`,
            DROP COLUMN `gw_price_refunded`,
            DROP COLUMN `gw_items_base_price_refunded`,
            DROP COLUMN `gw_items_price_refunded`,
            DROP COLUMN `gw_card_base_price_refunded`,
            DROP COLUMN `gw_card_price_refunded`,
            DROP COLUMN `gw_base_tax_amount_refunded`,
            DROP COLUMN `gw_tax_amount_refunded`,
            DROP COLUMN `gw_items_base_tax_refunded`,
            DROP COLUMN `gw_items_tax_refunded`,
            DROP COLUMN `gw_card_base_tax_refunded`,
            DROP COLUMN `gw_card_tax_refunded`,
            DROP COLUMN `reward_points_balance`,
            DROP COLUMN `base_reward_currency_amount`,
            DROP COLUMN `reward_currency_amount`,
            DROP COLUMN `base_rwrd_crrncy_amt_invoiced`,
            DROP COLUMN `rwrd_currency_amount_invoiced`,
            DROP COLUMN `base_rwrd_crrncy_amnt_refnded`,
            DROP COLUMN `rwrd_crrncy_amnt_refunded`,
            DROP COLUMN `reward_points_balance_refund`;
        ALTER TABLE `sales_order_address`
            DROP COLUMN `giftregistry_item_id`;
        ALTER TABLE `sales_order_grid`
            DROP COLUMN `refunded_to_store_credit`;
        ALTER TABLE `sales_order_item`
            DROP COLUMN `qty_returned`,
            DROP COLUMN `gw_id`,
            DROP COLUMN `gw_base_price`,
            DROP COLUMN `gw_price`,
            DROP COLUMN `gw_base_tax_amount`,
            DROP COLUMN `gw_tax_amount`,
            DROP COLUMN `gw_base_price_invoiced`,
            DROP COLUMN `gw_price_invoiced`,
            DROP COLUMN `gw_base_tax_amount_invoiced`,
            DROP COLUMN `gw_tax_amount_invoiced`,
            DROP COLUMN `gw_base_price_refunded`,
            DROP COLUMN `gw_price_refunded`,
            DROP COLUMN `gw_base_tax_amount_refunded`,
            DROP COLUMN `gw_tax_amount_refunded`,
            DROP COLUMN `event_id`,
            DROP COLUMN `giftregistry_item_id`;
        ALTER TABLE `salesrule`
            DROP COLUMN `rule_id`,
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
            DROP COLUMN `created_in`,
            DROP COLUMN `updated_in`,
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`rule_id`),
            DROP KEY `SALESRULE_CREATED_IN`,
            DROP KEY `SALESRULE_UPDATED_IN`,
            DROP KEY `SALESRULE_RULE_ID`;
        ALTER TABLE `salesrule_label`
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
            DROP INDEX `SALESRULE_LABEL_ROW_ID_STORE_ID`,
            ADD UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`);
        ALTER TABLE `salesrule_customer_group`
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`rule_id`,`customer_group_id`);
        ALTER TABLE `salesrule_product_attribute`
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`);
        ALTER TABLE `salesrule_website`
            CHANGE `row_id` `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
            DROP PRIMARY KEY,
            ADD PRIMARY KEY (`rule_id`,`website_id`);
        TRUNCATE wishlist;
        TRUNCATE email_wishlist;
        ALTER TABLE `wishlist`
            DROP COLUMN `name`,
            DROP COLUMN `visibility`,
            DROP KEY `WISHLIST_CUSTOMER_ID`,
            ADD UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`);
        ALTER TABLE `wishlist_item_option`
            DROP KEY `WISHLIST_ITEM_OPTION_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE`,
            ADD KEY `WISHLIST_ITEM_OPTION_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` (`product_id`);
        ALTER TABLE `yotpo_rich_snippets`
            CHANGE `average_score` `average_score` float(10,0) NOT NULL COMMENT 'Average Score';
        SET FOREIGN_KEY_CHECKS=1;
    COMMIT;
END
//
DELIMITER ;
CALL this_procedure();