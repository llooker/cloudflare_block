# Cloudflare Log Analytics Block

## How to implement this Block

Create a Looker database connection to funnel the demo data or leverage your existing log data in your BigQuery connection:

* **Name**: cloudflare_logs
* **Dialect**: Google BigQuery Standard SQL
* **Project name**: your_gcp_project_name
* **Dataset**: name of the BigQuery dataset you import Cloudflare logs to

Please download the Cloudflare Block from this Github repository into your Looker UI and follow the steps below:

1. Replace the connection name in the model file with your database connection name.
1. Replace the schema name in view files with your schema name.
1. Update any table names (for example your logs table may have a different name)

The Cloudflare logs model combines the following views: 
* Cloudflare logs
* Countries
* Current_second_stats
* events_per_second


## Learn more
[Cloudflare Analytics](https://support.cloudflare.com/hc/en-us/sections/200820478-General) 

[Cloudflare Enterprise logs](https://support.cloudflare.com/hc/en-us/sections/200820208-Logs) 

## What if I find an error or discrepancy? Suggestions for improvements?
If you have feedback for improvements or find any errors, feel free to create a "New Issue" in the github repository for this Cloudflare Block.

Please note that there are still some features that are missing in Cloudflare Enterprise Log Share which will be added at a later point. This could potentially lead to discrepancies.


## Fields
This default field set may change at any time. The full list of all available fields can be found by running the following Cloudflare logs API call:

`https://api.cloudflare.com/client/v4/zones/<zone_tag>/logs/received/fields` 

It will return the list of all available fields with its definitions. Click [here](https://support.cloudflare.com/hc/en-us/articles/216672448-Enterprise-Log-Share-Logpull-REST-API) for more information on Cloudflare Enterprise Log Share.  
