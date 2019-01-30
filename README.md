# Cloudflare Log Analytics Block

## How to implement this Block

Make sure you have a Looker account up and running. If you are using BigQuery, please follow Looker instructions on how to connect Bigquery to Looker. Once it’s done you will need to go to the github repository and download the following files. You might consider to replace the connection name in the model file with yours. If you decided to rename explore, model name and view files name, please make sure to update it everywhere by “Find & replace” option.

###### LookML model:
* cloudflare_looker

###### Dashboards:
* performanc_cloudflare
* reliability_cloudflare
* security_cloudflare
* snapshot_cloudflare

###### Views:
* cloudflare_logs
* countries
* current_second_stats
* events_per_second



## Learn more
[Cloudflare Enterprise Logs](https://developers.cloudflare.com/logs/)

[Glossary](https://developers.cloudflare.com/logs/reference/glossary/)

[Pathing Status](https://developers.cloudflare.com/logs/reference/pathing-status/)


## What if I find an error or discrepancy? Suggestions for improvements?
If you have feedback for improvements or find any errors, feel free to create a "New Issue" in the github repository for this Cloudflare Block.

Please note that there are still some features that are missing in Cloudflare Enterprise Log Share which will be added at a later point. This could potentially lead to discrepancies.


## Fields
This default field set may change at any time. The full list of all available fields can be found by running the following Cloudflare logs API call:

`https://api.cloudflare.com/client/v4/zones/<zone_tag>/logs/received/fields`

It will return the list of all available fields with its definitions. Click [here](https://support.cloudflare.com/hc/en-us/articles/216672448-Enterprise-Log-Share-Logpull-REST-API) for more information on Cloudflare Enterprise Log Share.
