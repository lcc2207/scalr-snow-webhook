# ServiceNow demo webhook

This webhook keeps Farm and Server records updated in ServiceNow.

Note: this works with custom servicenow tables for farm and server records, adjust the table names and the data that is saved in each table as necessary.

Table structure

##Table_name:
#Scalr Servers

id
environment_id
account_id
cloud_platform
cloud_location
farm_role_alias
farm_role_id
hostname
public_ip
private_ip
instance_type
farm
status


#Scalr Farms
id
owner_email
name
environment_id
environment_name
account_id
account_name
cost_center_name
cost_center_id
cost_center_billing_code
project_name
project_id
project_billing_code
