# BACKUP AND MIGRATION INSTRUCTIONS

PHASE 1: ADMIN PANEL PREPARATION
- Go to admin utilities on live site
- Clear database logs
- Check email and push notification status
- Wipe temp cache tables

PHASE 2: DATABASE EXPORT PROCESS
- Use Custom export mode for website database
- Uncheck all structure and views boxes
- Enable: Disable foreign key checks
- Disable: Add create view statement
- Enable: Truncate table before insert
- Enable: Insert ignore statements

PHASE 3: IMPORTING TO STAGING (mywebsitev2)
- Open staging DB manager
- Select backup file
- Make sure foreign key check is unchecked before hitting import

PHASE 4: STAGING SITE CONFIGURATION
- Turn off production mode in staging admin panel
- Replace PayMongo credentials (Public/Secret) with sandbox keys from spreadsheet
- Replace PayPal credentials (Client/Secret) with sandbox keys from spreadsheet
- Verify Google Geocoding and Maps JavaScript API keys against reference sheet
- Check Mobile API keys. If incorrect, run manual update query:
  UPDATE [TABLE_NAME] SET option_value = 'NEW_MOBILE_KEY' WHERE option_name = 'COLUMN_NAME';
- Update routing links for branches from live domain to staging format:
  Change https://mywebsite.com/[BRANCH_NAME] to https://mywebsitev2.com/[BRANCH_NAME]
