# ServiceNow demo webhook

This webhook keeps Farm and Server records updated in ServiceNow.

Note: this works with custom servicenow tables for farm and server records, adjust the table names and the data that is saved in each table as necessary.

#Table structure in SNOW

# Table_name:
## Scalr Servers

<table>
  <tr>
    <th>Column Name</th>
    <th>Type</th>
  </tr>
  <tr>
    <td>
    id
    </td> 
    <td>
    string
    </td> 
  </tr>
    <tr>
    <td>
    environment_id
    </td> 
    <td>
    string
    </td> 
  </tr>
    <tr>
    <td>
    account_id
    </td> 
    <td>
    string
    </td> 
  </tr>
  <tr>
    <td>
     cloud_platform
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     cloud_location
    </td> 
    <td>
     string
    </td> 
  </tr> 
  <tr>
    <td>
     farm_role_alias
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     farm_role_id
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     farm_role_alias
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     hostname
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     public_ip
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     instance_type
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     farm
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     status
    </td> 
    <td>
     string
    </td> 
  </tr>
</table>


## Scalr Farms
<table>
  <tr>
    <th>Column Name</th>
    <th>Type</th>
  </tr>
  <tr>
    <td>
    id
    </td> 
    <td>
    string
    </td> 
  </tr>
    <tr>
    <td>
    owner_email
    </td> 
    <td>
    string
    </td> 
  </tr>
    <tr>
    <td>
    name
    </td> 
    <td>
    string
    </td> 
  </tr>
  <tr>
    <td>
     environment_id
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     environment_name
    </td> 
    <td>
     string
    </td> 
  </tr> 
  <tr>
    <td>
     account_id
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     account_name
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     cost_center_name
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     cost_center_id
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     cost_center_billing_code
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     project_name
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     project_id
    </td> 
    <td>
     string
    </td> 
  </tr>
  <tr>
    <td>
     project_billing_code
    </td> 
    <td>
     string
    </td> 
  </tr>
</table>





# Instance setup. 
Execute "bootstrap.sh" on the target install

This will install docker and pull down the SNOW webhook repo.

# Update the uwsgi.ini file with your settings

```ini
[uwsgi]
chdir = /opt/snow-webhook
http-socket = 0.0.0.0:5018
wsgi-file = webhook.py
callable = app
workers = 1
master = true
plugin = python
env = SCALR_SIGNING_KEY=scalr_signing_key
env = SNOW_URL=https://xxx.service-now.com/
env = SNOW_USER=admin
env = SNOW_PASS=password
env = SCALR_URL=https://demo.scalr.com
env = SCALR_API_KEY=xxxx
env = SCALR_API_SECRET=xxxxx

```

# Launch
execute 'relaunch.sh'





