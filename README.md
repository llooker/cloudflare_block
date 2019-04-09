# Cloudflare Log Analytics Block

## How to implement this Block

Make sure you have a Looker account up and running. If you are using BigQuery, please follow Looker instructions on how to connect Bigquery to Looker.Please be aware that certain syntax may need to be modified for alternate database connections. Once it’s done you will need to go to the github repository and download the files below. Once you downloaded the files, drag them into your LookML project, or copy and paste the text.

You should replace the connection name in the model file with yours. All the table names need to be updated to the customer's table names as well. If you decided to rename the filenames of explore, model name and view, then please make sure to update all mentions within the other files, else this will result in errors.

[More](https://docs.looker.com/data-modeling/getting-started/model-development)

###### LookML model:
* cloudflare_looker

###### Dashboards*:
* performanc_cloudflare
* reliability_cloudflare
* security_cloudflare
* snapshot_cloudflare
* bot_management_cloudflare

###### Views:
* cloudflare_logs
* countries
* current_second_stats
* events_per_second




<br>
<u>Dashboards*</u>
In order to avoid errors in dashboards LookML files please make sure the following rows are commented in model file "cloudflare_looker":
# include all the dashboards
# include: "*.dashboard.lookml"


## Learn more
[Cloudflare Enterprise Logs](https://developers.cloudflare.com/logs/)

[Glossary](https://developers.cloudflare.com/logs/reference/glossary/)

[Pathing Status](https://developers.cloudflare.com/logs/reference/pathing-status/)


## What if I find an error or discrepancy? Suggestions for improvements?
If you have feedback for improvements or find any errors, feel free to create a "New Issue" in the github repository for this Cloudflare Block.

Please note that there are still some features that are missing in Cloudflare Enterprise Log Share which will be added at a later point. This could potentially lead to discrepancies.


## Fields
In these reports we use all available ELS fields.

This default field set may change at any time. The full list of all available fields can be found by running the following Cloudflare logs API call:

`https://api.cloudflare.com/client/v4/zones/<zone_tag>/logs/received/fields`

It will return the list of all available fields with its definitions. Click [here](https://developers.cloudflare.com/logs/) for more information on Cloudflare Enterprise Log Share.
