# Cloudflare Log Analytics Block

## How to implement this Block

Create a Looker database connection to funnel the demo data:

* **Name**: cloudflare_logs
* **Dialect**: Google BigQuery Standard SQL
* **Project name**: your_gcp_project_name
* **Dataset**: name of the BigQuery dataset you import Cloudflare logs to


Copy the LookML files to your Looker project and start exploring.

Please download the Cloudflare Block from this Github repository into your Looker UI and follow the steps below:

1. Replace the connection name in the model file.
1. Replace the schema name in view files with your schema name.

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

## Glossary 

Request - record of the request that has been processed through Cloudflare
Origin requests - requests that has been served from the origin
Cached requests - number of requests served from Cloudflare without hitting the origin. Cached requests are the sum of all requests where “CacheCacheStatus” equals "hit", "stale", "updating", "ignored" (!doesn’t include “revalidated” since the request been sent to the origin)
Uncached requests - number of requests that are not cached and served from the origin. Uncached requests are sum of all requests where “CacheCacheStatus” doesn’t equal to "hit", "stale", "updating" or "ignored"
Total bandwidth (Total egress bandwidth, Edge bandwidth) - the amount of data transferred from Cloudflare to end-users within a certain period of time. Total bandwidth equals the sum of all “EdgeResponseBytes” for a certain period of time
Origin bandwidth (Origin egress bandwdith) - the amount of data transferred from the origin to Cloudflare within a certain period of time. Origin bandwidth is sum of all “EdgeResponseBytes” where “OriginResponseStatus” doesn’t equal to “0”
Cached bandwidth (Cached egress bandwdith) - the amount of bandwidth served from Cloudflare without hitting the origin. Cached bandwidth is sum of all “EdgeResponseBytes” where “CacheCacheStatus” equals "hit", "stale", "updating", "ignored" or "revalidated"  
Saved bandwidth (Saved egress bandwidth) - the percentage of bandwidth saved by caching on Cloudflare. 
Uncached bandwidth (Uncached egress bandwidth) - the amount of bandwidth that is not cached and served from the origin. Uncached bandwidth is sum of all “EdgeResponseBytes” where “CacheCacheStatus” doesn’t equal "hit", "stale", "updating", "ignored" or "revalidated" 
Static Content -  website content that can be delivered to an end-user without hitting the origin (directly from cache)
Dynamic Content - website content that has to be fetched from the origin

Threat - malware with potential to cause serious damage and can lead to attacks. In addition to threat analytics you can also monitor search engine crawlers going to your websites. Cloudflare uses the IP reputation of a visitor to decide whether to present a challenge. A Cloudflare internal algorithm calculates an IP's reputation and assigns a threat score that ranges from 0 to 100. 

The security levels and the challenge display criteria:  

High - for scores greater than 0
Medium - for scores greater than 14
Low - for scores greater than 24
Essentially off - for scores greater than 49

Total Threats Stopped - measures the number of “suspicious” and “bad” requests that were aimed at your site. 

Threat types 
Bad browser (BIC) - Browser Integrity Check. The source of the request was not legitimate or the request itself was malicious. Users would see a 1010 error page in their browser. Cloudflare's Browser Integrity Check looks for common HTTP headers abused most commonly by spammers and denies them access to your page. It will also challenge visitors that do not have a user agent or a non standard user agent (also commonly used by bots, crawlers, or visitors)
Blocked hotlink - "Hotlink Protection" ensures that other sites cannot use your bandwidth by building pages that link to images hosted on your origin server. This feature can be turned on and off by Cloudflare’s customers
Bad IP - A request that came from an IP address that is not trusted by Cloudflare based on the Threat Score
Country block - Requests from countries that were blocked based on the user configuration set within the Firewall
IP block (user) - Requests from specific IP addresses that were blocked based on the user configuration set within the Firewall
IP range block (/16) - A /16 IP range that was blocked based on the user configuration set within the Firewall
IP range block (/24) - A /24 IP range that was blocked based on the user configuration set within the Firewall
IPv6 block (user) - Requests from specific IPv6 addresses that were blocked based on the user configuration set within the Firewall
IPv6 range block (/64) - A /64 IPv6 range that was blocked based on the user configuration set within the Firewall
IPv6 range block (/48) - A /48 IPv6 range that was blocked based on the user configuration set within the Firewall
IPv6 range block (/32) - A /32 IPv6 range that was blocked based on the user configuration set within the Firewall
Captcha Error - Requests made by a bot that failed to pass the challenge
New Captcha (user) - Challenge based on user configurations set for visitor’s IP in either the WAF or the Firewall 

Traffic Types  
NoRecord - regular requests 
Whitelist - request has been sent from whitelisted IP address
SearchEngine - Search Engine
BadHost -  bad or no host header
backupService - Backup service
monitoringService - Monitoring service
Tor - using tor browser
BadIP - A request that came from an IP address that is not trusted by Cloudflare based on the Threat Score

WAF Events - events that been triggered based on Web Applications Firewall rules

Edge Pathing Statuses

EdgePathingSrc: The stage that made the routing decision
EdgePathingOp: The specific action that is being taken
EdgePathingStatus: Additional information complementing the EdgePathingOp


EdgePathingStatus
Description
EdgePathingOp
EdgePathingSrc
Status Code
Errors
Requests that didn't pass sanity checking
cyclic
CloudFlare loop
err_host


403
dns_err
unable to resolve
err_host


409
reserved_ip
DNS points to local or disallowed IP
err_host


403
reserved_ip6
DNS points to local or disallowed IPv6 address
err_host


403
bad_host
bad or no Host header
err_host


403
fint
zone has been "finted" - administratively disabled, effectively setting DNS to route around CloudFlare
err_host


409
no_existing_host
ownership lookup failed: host possibly not on Cloudflare
err_host


409
User based actions
Actions triggered from the user based on the configuration for a specific IP-(ranges)
Asnum, ip, ipr24, ipr16, ip6, ip6r64, ip6r48, ip6r32, ctry
ban the request completely 
ban


403
Asnum, ip, ipr24, ipr16, ip6, ip6r64, ip6r48, ip6r32, ctry
whitelist the request. WAF will not execute.
wl




For challenge pages, see section Javascript & Captcha challenge
Filter-based firewall
The filter-based firewall takes actions based on which filters matched
filter_based_firewall
request has been blocked 
ban 





filter_based_firewall



request has been white-listed
wl







For challenge pages, see section Javascript & Captcha challenge
Zone lockdown
Zone lockdown will block visitors to particular URIs where the visitor's IP is not whitelisted
zl


ban
user


Firewall User-Agent Block
will challenge (captcha/js) or block visitors with particular User-Agent strings






ua
Blocked User-Agent
ban
user


For challenge pages, see section Javascript & Captcha challenge
Browser Integrity Check








empty


ban
bic


Hot Linking 


ban
hot


empty








L7-to-L7 DDoS mitigation
Requests dropped by L7 mitigation
l7ddos
Request has been blocked
ban
protect


IP Reputation (MACRO)
The macro stage is composed of many different paths. They are categorized by the reputation of the visitor IP 
nr
There is no reputation data for the IP and no action is being taken (if IUAM is on, a JS challenge is being served)
wl




wl
IP is explicitly whitelisted (added via Ninja Panel)
wl




scan
IP is explicitly whitelisted and categorized as a security scanner (added via Ninja Panel)
wl




mon
IP is explicitly whitelisted and categorized as monitoring Service (added via Ninja Panel)
wl




bak
IP is explicitly whitelisted and categorized as a Backup Service (added via Ninja Panel)
wl




mob
IP is explicitly whitelisted and categorized as mobile proxy Service (added via Ninja Panel)
wl




se
The IP is explicitly whitelisted as it belongs to a search engine crawler and no action is being taken
wl




grey
The IP is greylisted (suspected to be bad) but the request was either for a favicon or security is turned off and such is being whitelisted.
wl




bad_ok
The reputation score of the IP is bad (or TOR IP) but the request was either for a favicon or security is turned off and such is being whitelisted. Alternatively, the threat score of the IP is in the accepted security level.
wl




unknown
The pathing_status is unknown and the request is being processed as normal
wl




All other paths in the MACRO stage issue a challenge. Possible scenarios are:
a clean IP (acceptable threat level) with IUAM on will trigger the JS challenge
a greylisted IP triggers the JS challenge (captcha challenge if IUAM is on)
an IP with bad reputation (also TOR) with a threat level above the accepted threshold triggers a captcha challenge (JS challenge if IUAM is on)

Rate Limiting








rate_limit
The request was dropped
ban
user


rate_limit
Rate limiting is only simulated and the request was processed normally
simulate
user


Special cases








ao_crawl
AO (Always Online) crawler request
wl
skip


cdnjs
 request to a cdnjs resource
wl
skip




certain challenge forced by our special headers


forced


Javascript & Captcha challenge
chl
A captcha/javascript challenge was presented
captcha_new
jschl_new


403 
503
temp_ok
A captcha/javascript challenge would have been presented but a clearance cookie was present
captcha_ok
jschl_ok


As per request
temp_ok
A captcha challenge was solved correctly and a clearance cookie will be issued
captcha_succ
jschl_succ
macro
302 (Redirect to original URL)
chl
A failed attempt at solving the captcha challenge, no clearance cookie will be issued
captcha_fail
jschl_fail
macro
302 (Redirect to original URL)
chl
A failed attempt at solving the captcha challenge, no clearance cookie will be issued. Not enough data was provided to solve the challenge. The difference to the previous case is that not all input was provided which is needed to verify the solution
captcha_err
jschl_err
macro

302 (Redirect to original URL)



chl
A blinded-token redemption was successful
tok_redemp_succ


As per request
chl
A blinded-token redemption failed
tok-redemp_fail


As per request

