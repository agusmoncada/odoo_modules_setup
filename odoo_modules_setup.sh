#!/bin/bash

#chmod +x odoo_modules_setup.sh
#./odoo_modules_setup.sh

# Configuration
ODOO_COMMAND="sudo -u odoo odoo"  # Odoo executable command
ODOO_CONF="/etc/odona/ateliernuevo.cloudpepper.site/odoo.conf"  # Odoo configuration file
DATABASE="ateliernuevo.cloudpepper.site"  # Name of your database
MODULES=(
    sale_management
    account
    crm
    website
    stock
    purchase
    project
    mrp
    hr_holidays
    hr
    account_financial_report
    auditlog
    maintenance
    mis_builder
    partner_vat_unique
    purchase_request
    mail
    contacts
    calendar
    web_responsive
    account_ux
    l10n_ar_account_withholding_ratio
    l10n_ar_afipws
    l10n_ar_afipws_fe
    l10n_ar_bank
    l10n_ar_purchase
    l10n_ar_purchase_stock
    l10n_ar_reports
    l10n_ar_ux
    l10n_latam_base
    purchase_price_diff
    stock_account
    website_crm
    website_crm_sms
    website_sms
    purchase_stock
    account_check_printing
    account_debit_note
    account_edi
    account_edi_ubl_cii
    account_payment
    account_payment_group
    account_payment_invoice_online_payment_patch
    account_sequence
    account_statement_base
    account_statement_import_base
    account_statement_import_file
    account_statement_import_sheet_file
    account_statement_import_txt_xlsx
    account_withholding
    account_withholding_automatic
    analytic
    base_automation
    auth_signup
    auth_totp
    auth_totp_mail
    auth_totp_portal
    barcodes
    barcodes_gs1_nomenclature
    base
    base_import
    base_install_request
    base_setup
    base_sparse_field
    base_vat
    base_view_inheritance_extension
    bi_view_editor
    bi_view_editor_spreadsheet_dashboard
    bus
    calendar_sms
    crm_iap_enrich
    crm_iap_mine
    crm_sms
    date_range
    date_range_account
    digest
    google_gmail
    google_recaptcha
    hr_org_chart
    iap
    iap_crm
    iap_mail
    l10n_ar
    l10n_ar_account_withholding
    l10n_latam_account_sequence
    l10n_latam_check
    l10n_latam_invoice_document
    mail_bot
    mail_bot_hr
    mrp_account
    partner_autocomplete
    payment
    portal_odoo_debranding
    portal_rating
    privacy_lookup
    product
    project_mrp
    project_purchase
    project_sms
    project_timeline
    purchase_mrp
    rating
    report_xlsx
    resource
    sale
    sale_crm
    sale_mrp
    sale_product_configurator
    sale_project
    sale_project_stock
    sale_purchase
    sale_purchase_stock
    sale_sms
    sale_stock
    sales_team
    sms
    snailmail
    snailmail_account
    social_media
    spreadsheet
    spreadsheet_account
    spreadsheet_dashboard
    spreadsheet_dashboard_account
    spreadsheet_dashboard_oca
    spreadsheet_dashboard_purchase
    spreadsheet_dashboard_purchase_stock
    spreadsheet_dashboard_sale
    spreadsheet_dashboard_stock_account
    spreadsheet_oca
    stock_sms
    uom
    utm
    web
    web_company_color
    web_editor
    web_kanban_gauge
    web_save_discard_button
    web_timeline
    web_tour
    web_unsplash
    website_form_project
    website_mail
    website_payment
    hr_maintenance
    board
    portal
    http_routing
    phone_validation
    account_mass_reconcile
    account_move_line_reconcile_manual
    account_reconcile_oca
    account_statement_import_file_reconcile_oca
)

echo "Starting module installation/upgrades..."
echo "Database: $DATABASE"

# Loop through each module and install/upgrade it
for MODULE in "${MODULES[@]}"; do
    echo "Processing module: $MODULE"
    
    # Correctly construct the Odoo command
    $ODOO_COMMAND -c "$ODOO_CONF" --no-http --stop-after-init -d "$DATABASE" -u "$MODULE"
    
    # Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Module $MODULE processed successfully!"
    else
        echo "Error: Module $MODULE failed to process!"
        echo "Stopping script to prevent further errors."
        exit 1
    fi
done
