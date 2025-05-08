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
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::index";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::company"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::index";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::view_account";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::company"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::view_account";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::view_account"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::view_account";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::edit_account";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::company"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::edit_account";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::view_account"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::edit_account";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::edit_account"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::edit_account";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_view";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_view";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users_view"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_view";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users_view"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users_add"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users_edit"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::users_delete"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::users_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_view";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_view";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles_view"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_view";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles_view"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles_add"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles_edit"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::roles_delete"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::roles_edit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::view_orders";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::view_orders";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::place_order";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::place_order";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders_add"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::place_order";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::credit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::credit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders_add"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::credit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::use_credit"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Company::credit";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::index"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::view_orders";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::view_orders";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders_view"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::view_orders";
        INSERT INTO
            amasty_company_account_permission
        SELECT
            NULL,
            company_permissions.role_id,
            "Amasty_CompanyAccount::orders_all_view"
        FROM
            company_permissions
        WHERE
            resource_id = "Magento_Sales::view_orders";
        INSERT INTO
            amasty_company_account_company
        SELECT
            company.entity_id,
            company.company_name,
            company.status,
            company.legal_name,
            company.company_email,
            company.vat_tax_id,
            company.reseller_id,
            company.comment,
            company.street,
            company.city,
            company.country_id,
            company.region,
            company.region_id,
            company.postcode,
            company.telephone,
            company.customer_group_id,
            company.sales_representative_id,
            company.super_user_id,
            company.reject_reason,
            company.rejected_at,
            1,
            1
        FROM
            company;
        TRUNCATE amasty_company_account_customer;
        INSERT IGNORE INTO
            amasty_company_account_customer
        SELECT
            company_advanced_customer_entity.customer_id,
            company_advanced_customer_entity.company_id,
            company_advanced_customer_entity.job_title,
            company_advanced_customer_entity.telephone,
            company_roles.role_id,
            company_advanced_customer_entity.status
        FROM
            company_advanced_customer_entity
        LEFT JOIN 
            company_roles
            ON
                company_advanced_customer_entity.company_id = company_roles.company_id;
        INSERT INTO
            amasty_company_account_order
        SELECT
            company_order_entity.order_id,
            company_order_entity.company_id,
            company_order_entity.company_name
        FROM
            company_order_entity;
        INSERT INTO
            amasty_company_account_role
        SELECT
            company_roles.role_id,
            company_roles.role_name,
            company_roles.company_id,
            0
        FROM
            company_roles;
        INSERT INTO
            amasty_company_credit
        SELECT
            company_credit.entity_id,
            company_credit.company_id,
            company_credit.balance,
            company_credit.credit_limit,
            0,
            company_credit.currency_code,
            0,
            0,
            1,
            1,
            0,
            0
        FROM
            company_credit;
        SET foreign_key_checks = 1;
    COMMIT;
END
//
DELIMITER ;
CALL this_procedure();
