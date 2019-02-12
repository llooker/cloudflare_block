view: cloudflare_logs {
  sql_table_name: cloudflare_logs.camiliame_logs ;;


  dimension: is_threat {
    type: yesno
    sql: (edgePathingSrc = 'bic' AND edgePathingOp = 'ban' AND edgePathingStatus = 'unknown') OR
          (edgePathingSrc = 'hot' AND edgePathingOp = 'ban' AND edgePathingStatus = 'unknown') OR
          (edgePathingSrc = 'hot' AND edgePathingOp = 'ban' AND edgePathingStatus = 'ip') OR
          (edgePathingSrc = 'macro' AND edgePathingOp = 'ban' AND edgePathingStatus = 'unknown') OR
          (edgePathingSrc = 'macro' AND edgePathingOp = 'chl' AND edgePathingStatus = 'captchaFail') OR
          (edgePathingSrc = 'macro' AND edgePathingOp = 'chl' AND edgePathingStatus ='jschlFail') OR
          (edgePathingSrc = 'user' AND edgePathingOp = 'ban' AND edgePathingStatus = 'zl') OR
          (edgePathingSrc = 'user' AND edgePathingOp = 'ban' AND edgePathingStatus = 'ua') OR
          (edgePathingSrc = 'user' AND edgePathingOp = 'ban' AND edgePathingStatus = 'rateLimit') OR
          (edgePathingSrc = 'filterBasedFirewall' AND edgePathingOp = 'ban' AND edgePathingStatus = 'unknown') OR
          (edgePathingSrc = 'filterBasedFirewall' AND edgePathingOp = 'chl') OR
          (edgePathingSrc = 'user' AND edgePathingOp = 'ban' AND edgePathingStatus = 'ctry') OR
          (edgePathingSrc = 'user' AND edgePathingOp = 'ban' AND edgePathingStatus = 'ip') OR
          (edgePathingSrc = 'user' AND edgePathingOp = 'ban' AND edgePathingStatus IN ('ipr16', 'ipr24', 'ip6', 'ip6r64', 'ip6r48', 'ip6r32'));;
  }


  dimension: is_bot {
    type: yesno
    sql: (edgePathingSrc = 'filterBasedFirewall' AND edgePathingStatus = 'captchaNew');;
    group_label: "Bot"
  }

    dimension: is_false_detected_bot {
    type: yesno
    sql: (edgePathingSrc = 'filterBasedFirewall' AND edgePathingStatus = 'captchaSucc');;
    group_label: "Bot"
  }

  dimension: is_dynamic {
    type: yesno
    sql: ${cache_cache_status} IN ("bypass", "unknown") ;;
  }

  dimension: is_static {
    type: yesno
    sql: ${cache_cache_status} NOT IN ("bypass", "unknown") ;;
  }

  dimension: edgepathingstatus_full {
    type: string
    sql:  case when ${edge_pathing_src}='user' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='ip' then 'ip block'
               when ${edge_pathing_src}='user' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='ctry' then 'country block'
               when ${edge_pathing_src}='user' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='zl' then 'routed by zone lockdown'
               when ${edge_pathing_src}='user' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='ua' then 'blocked user agent'
               when ${edge_pathing_src}='user' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='rateLimit' then 'rate-limiting rule'
              when ${edge_pathing_src}='filterBasedFirewall' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='unknown' then 'blocked by filter based firewall'
              when ${edge_pathing_src}='filterBasedFirewall' AND ${edge_pathing_op}='chl' then 'challenged by filter based firewall'
               when ${edge_pathing_src}='bic' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='unknown' then 'browser integrity check'
               when ${edge_pathing_src}='hot' AND ${edge_pathing_op}='ban' AND ${edge_pathing_status}='unknown' then 'blocked hotlink'
               when ${edge_pathing_src}='macro' AND ${edge_pathing_op}='chl' AND ${edge_pathing_status}='captchaFail' then 'CAPTCHA challenge failed'
               when ${edge_pathing_src}= 'macro' AND ${edge_pathing_op}='chl' AND ${edge_pathing_status}='jschlFail' then 'java script challenge failed'
      else ${edge_pathing_status}
      end ;;
    group_label: "Edge"
  }

  dimension: cache_cache_status {
    type: string
    sql: ${TABLE}.CacheCacheStatus ;;
    group_label: "Cache"
  }

  dimension: is_cached {
    type: yesno
    sql: ${cache_cache_status} IN ("hit", "stale", "updating") ;;
  }

  dimension: is_cached_r {
    type: yesno
    sql: ${cache_cache_status} IN ("hit", "stale", "updating", "ignored") ;;
  }

  dimension: is_not_cached_r {
    type: yesno
    sql: ${cache_cache_status} NOT IN ("hit", "stale", "updating", "ignored") ;;
  }

  dimension: is_cached_b {
    type: yesno
    sql: ${cache_cache_status} IN ("hit", "stale", "updating", "ignored", "revalidated") ;;
  }

  dimension: is_not_cached_b {
    type: yesno
    sql: ${cache_cache_status} NOT IN ("hit", "stale", "updating", "ignored", "revalidated") ;;
  }

  dimension: cache_response_bytes {
    type: number
    sql: ${TABLE}.CacheResponseBytes ;;
    group_label: "Cache"
  }


  dimension: cache_response_status {
    type: number
    sql: ${TABLE}.CacheResponseStatus ;;
    group_label: "Cache"
  }

  dimension: cache_tiered_fill {
    type: yesno
    sql: ${TABLE}.CacheTieredFill ;;
    group_label: "Cache"
  }

  dimension: client_asn {
    type: string
    sql: ${TABLE}.ClientASN ;;
    group_label: "Client"
  }

  dimension: client_country_code {
    type: string
    sql: Upper(${TABLE}.ClientCountry) ;;
    group_label: "Client"
    map_layer_name: countries
  }

  dimension: client_device_type {
    type: string
    sql: ${TABLE}.ClientDeviceType ;;
    group_label: "Client"
  }

  dimension: client_ip {
    type: string
    sql: ${TABLE}.ClientIP ;;
    group_label: "Client"
  }

  dimension: client_ipclass {
    type: string
    sql: ${TABLE}.ClientIPClass ;;
    group_label: "Client"
  }

  dimension: client_request_bytes {
    type: number
    sql: ${TABLE}.ClientRequestBytes ;;
    group_label: "Client"
  }

  dimension: client_request_host {
    type: string
    sql: ${TABLE}.ClientRequestHost ;;
    group_label: "Client"
  }

  dimension: client_request_method {
    type: string
    sql: ${TABLE}.ClientRequestMethod ;;
    group_label: "Client"
  }

  dimension: client_request_protocol {
    type: string
    sql: ${TABLE}.ClientRequestProtocol ;;
    group_label: "Client"
  }

  dimension: client_request_referer {
    type: string
    sql: ${TABLE}.ClientRequestReferer ;;
    group_label: "Client"
  }

  dimension: client_request_referer_wrap {
    sql:  ${client_request_referer} ;;
    html: <a href="{{value}}">{{ munged_client_referer_1._value }}</a> ;;
    group_label: "Client"
  }

  dimension: munged_client_referer_1 {
    sql: case when char_length(ClientRequestReferer) > 150 then CONCAT(substr(ClientRequestReferer,1,50),'...') else ClientRequestReferer end ;;
    #sql: REPLACE(${client_request_referer},'/','/ ') ;;
    hidden: yes
  }

  dimension: munged_client_referer_2 {
    sql: REPLACE(${client_request_referer},',',', ') ;;
    hidden: yes
  }

  dimension: client_request_uri {
    type: string
    sql: ${TABLE}.ClientRequestURI ;;
    group_label: "Client"
  }

  dimension: client_request_uri_no_string {
    type: string
    sql: REGEXP_EXTRACT(${client_request_uri}, '^([^?]+)') ;;
    group_label: "Client"
  }

  dimension: client_request_uri_wrap {
    sql:  ${client_request_uri} ;;
    html: <a href="{{value}}">{{ munged_client_request_uri1._value }}</a> ;;
    group_label: "Client"
  }

  dimension: munged_client_request_uri1 {
    sql: case when char_length(ClientRequestURI) > 50 then CONCAT(substr(ClientRequestURI,1,50),'...') else ClientRequestURI end ;;
    #sql: REPLACE(${client_request_uri},'/','/ ') ;;
    hidden: yes
  }

  dimension: munged_client_request_uri2 {
    sql: REPLACE(${client_request_uri},',',', ') ;;
    hidden: yes
  }


  dimension: client_request_user_agent {
    type: string
    sql: ${TABLE}.ClientRequestUserAgent ;;
    group_label: "Client"
  }

  dimension: client_request_user_agent_wrap {
    sql:  ${client_request_user_agent} ;;
    html: <a href="{{value}}">{{ munged_client_request_user_agent1._value }}</a> ;;
    group_label: "Client"
  }

  dimension: munged_client_request_user_agent1 {
    sql: case when char_length(ClientRequestUserAgent) > 150 then CONCAT(substr(ClientRequestUserAgent,1,50),'...') else ClientRequestUserAgent end ;;
    #sql: REPLACE(${client_request_user_agent},'/','/ ') ;;
    hidden: yes
  }

  dimension: munged_client_request_user_agent2 {
    sql: REPLACE(${client_request_user_agent},',',', ') ;;
    hidden: yes
  }


  dimension: client_src_port {
    type: number
    sql: ${TABLE}.ClientSrcPort ;;
    group_label: "Client"
  }

  dimension: client_sslcipher {
    type: string
    sql: ${TABLE}.ClientSSLCipher ;;
    group_label: "Client"
  }

  dimension: client_sslprotocol {
    type: string
    sql: ${TABLE}.ClientSSLProtocol ;;
    group_label: "Client"
  }

  dimension: edge_colo_id {
    type: number
    sql: ${TABLE}.EdgeColoID ;;
    group_label: "Edge"
  }

  dimension_group: edge_end_timestamp {
    group_label: "Edge End Timeframes"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      second,
      minute,
      minute15
    ]
    sql: ${TABLE}.EdgeEndTimestamp ;;
  }

  # Custom dimension added by Bruce
  dimension: edge_response_time {
    type: number
    sql: TIMESTAMP_DIFF(${edge_end_timestamp_raw}, ${edge_start_timestamp_raw}, SECOND) ;;
    group_label: "Edge"
  }

  dimension: edge_pathing_op {
    type: string
    sql: ${TABLE}.EdgePathingOp ;;
    group_label: "Edge"
  }

  dimension: edge_pathing_src {
    type: string
    sql: ${TABLE}.EdgePathingSrc ;;
    group_label: "Edge"
  }

  dimension: edge_pathing_status {
    type: string
    sql: ${TABLE}.EdgePathingStatus ;;
    group_label: "Edge"
  }

  dimension: edge_rate_limit_action {
    type: string
    sql: ${TABLE}.EdgeRateLimitAction ;;
    group_label: "Edge"
  }

  dimension: edge_rate_limit_id {
    type: number
    sql: ${TABLE}.EdgeRateLimitID ;;
    group_label: "Edge"
  }

  dimension: edge_request_host {
    type: string
    sql: ${TABLE}.EdgeRequestHost ;;
    group_label: "Edge"
  }

  dimension: edge_response_bytes {
    type: number
    sql: ${TABLE}.EdgeResponseBytes ;;
    group_label: "Edge"
  }

  dimension: edge_response_compression_ratio {
    type: number
    sql: ${TABLE}.EdgeResponseCompressionRatio ;;
    group_label: "Edge"
  }

  dimension: edge_response_content_type {
    type: string
    sql: ${TABLE}.EdgeResponseContentType ;;
    group_label: "Edge"
  }

  dimension: edge_response_content_type_group {
    type: string
    group_label: "Edge"
      sql: REGEXP_EXTRACT(${edge_response_content_type}, '([^;]*)')  ;;
  }

  dimension: edge_response_status {
    type: number
    sql: ${TABLE}.EdgeResponseStatus ;;
    group_label: "Edge"
  }

  dimension: edge_response_status_class {
    type: string
    group_label: "Edge"
    sql: CASE WHEN ${TABLE}.EdgeResponseStatus BETWEEN 200 and 299 THEN '2xx'
              WHEN ${TABLE}.EdgeResponseStatus BETWEEN 300 and 399 THEN '3xx'
              WHEN ${TABLE}.EdgeResponseStatus BETWEEN 400 and 499 THEN '4xx'
              WHEN ${TABLE}.EdgeResponseStatus BETWEEN 500 and 599 THEN '5xx'
              WHEN ${TABLE}.EdgeResponseStatus BETWEEN 0 and 099 THEN '0 - Served from CF Edge'
          END ;;
  }

  dimension: edge_response_status_class_5xx {
    type: string
    group_label: "Edge"
    sql: CASE WHEN ${TABLE}.EdgeResponseStatus BETWEEN 500 and 599 THEN '5xx'
      END ;;
  }

  dimension: edge_response_status_class_4xx {
    type: string
    group_label: "Edge"
    sql: CASE WHEN ${TABLE}.EdgeResponseStatus BETWEEN 400 and 499 THEN '4xx'
      END ;;
  }

  dimension: edge_response_status_class_3xx {
    type: string
    group_label: "Edge"
    sql: CASE WHEN ${TABLE}.EdgeResponseStatus BETWEEN 300 and 399 THEN '3xx'
      END ;;
  }


  dimension: edge_server_ip {
    type: string
    sql: ${TABLE}.EdgeServerIP ;;
    group_label: "Edge"
  }

  dimension_group: edge_start_timestamp {
    group_label: "Edge Start Timeframes"
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year,
#       second,
      minute,
      minute15
    ]
    sql: ${TABLE}.EdgeStartTimestamp ;;
  }

  dimension: edge_start_timestamp_second {
    type: date_time
    group_label: "Edge"
    sql: TIMESTAMP_TRUNC(${TABLE}.EdgeStartTimestamp, SECOND) ;;
  }

  dimension: origin_ip {
    type: string
    sql: ${TABLE}.OriginIP ;;
    group_label: "Origin"
  }

  dimension: origin_response_bytes {
    type: number
    sql: ${TABLE}.OriginResponseBytes ;;
    group_label: "Origin"
  }

  dimension: origin_response_httpexpires {
    type: string
    sql: ${TABLE}.OriginResponseHTTPExpires ;;
    group_label: "Origin"
  }

  dimension: origin_response_httplast_modified {
    type: string
    sql: ${TABLE}.OriginResponseHTTPLastModified ;;
    group_label: "Origin"
  }

  dimension: origin_response_status {
    type: number
    sql: ${TABLE}.OriginResponseStatus ;;
    group_label: "Origin"
  }

  dimension: is_origin {
    type: yesno
    sql: ${origin_response_status} != 0 ;;
  }

  dimension: origin_response_status_class {
    type: string
    group_label: "Origin"
    sql: CASE WHEN ${TABLE}.OriginResponseStatus BETWEEN 200 and 299 THEN '2xx'
              WHEN ${TABLE}.OriginResponseStatus BETWEEN 300 and 399 THEN '3xx'
              WHEN ${TABLE}.OriginResponseStatus BETWEEN 400 and 499 THEN '4xx'
              WHEN ${TABLE}.OriginResponseStatus BETWEEN 500 and 599 THEN '5xx'
              WHEN ${TABLE}.OriginResponseStatus BETWEEN 0 and 099 THEN '0 - Served from CF Edge'
          END ;;
  }

  dimension: origin_response_status_class_5xx {
    type: string
    group_label: "Origin"
    sql: CASE WHEN ${TABLE}.OriginResponseStatus BETWEEN 500 and 599 THEN '5xx'
              END ;;
  }

  dimension: origin_response_status_class_4xx {
    type: string
    group_label: "Origin"
    sql: CASE WHEN ${TABLE}.OriginResponseStatus BETWEEN 400 and 499 THEN '4xx'
              END ;;
  }

  dimension: origin_response_status_class_3xx {
    type: string
    group_label: "Origin"
    sql: CASE WHEN ${TABLE}.OriginResponseStatus BETWEEN 300 and 399 THEN '3xx'
      END ;;
  }

  dimension: origin_response_time {
    type: number
    sql: ${TABLE}.OriginResponseTime ;;
    group_label: "Origin"
  }

  dimension: origin_sslprotocol {
    type: string
    sql: ${TABLE}.OriginSSLProtocol ;;
    group_label: "Origin"
  }

  dimension: parent_ray_id {
    type: string
    sql: ${TABLE}.ParentRayID ;;
  }

  dimension: ray_id {
    type: string
    sql: ${TABLE}.RayID ;;
  }

  dimension: security_level {
    type: string
    sql: ${TABLE}.SecurityLevel ;;
  }

  dimension: wafaction {
    type: string
    sql: ${TABLE}.WAFAction ;;
    group_label: "WAF"
  }

  dimension: wafflags {
    type: number
    sql: ${TABLE}.WAFFlags ;;
    group_label: "WAF"
  }

  dimension: wafmatched_var {
    type: string
    sql: ${TABLE}.WAFMatchedVar ;;
    group_label: "WAF"
  }

  dimension: wafprofile {
    type: string
    sql: ${TABLE}.WAFProfile ;;
    group_label: "WAF"
  }

  dimension: wafrule_id {
    type: string
    sql: ${TABLE}.WAFRuleID ;;
    group_label: "WAF"
  }

  dimension: wafrule_message {
    type: string
    sql: ${TABLE}.WAFRuleMessage ;;
    group_label: "WAF"
  }

  dimension: worker_cputime {
    type: number
    sql: ${TABLE}.WorkerCPUTime ;;
    group_label: "Worker"
  }

  dimension: worker_status {
    type: string
    sql: ${TABLE}.WorkerStatus ;;
    group_label: "Worker"
  }

  dimension: worker_subrequest {
    type: yesno
    sql: ${TABLE}.WorkerSubrequest ;;
    group_label: "Worker"
  }

  dimension: worker_subrequest_count {
    type: number
    sql: ${TABLE}.WorkerSubrequestCount ;;
    group_label: "Worker"
  }

  dimension: zone_id {
    type: number
    sql: ${TABLE}.ZoneID ;;
  }


#########################################################################################
#################################    MEASURES    ########################################
#########################################################################################

  measure: count {
    type: count
    drill_fields: [default*]
    label: "Requests"
    }

  measure: bot_count {
    type: count
    filters: {
      field: is_bot
      value: "yes"
    }
    drill_fields: [default*]
    label: "bot count"
  }

  measure: false_bot_count {
    type: count
    filters: {
      field: is_false_detected_bot
      value: "yes"
    }
    drill_fields: [default*]
    label: "false bot count"
  }

  measure: bad_bot_count {
    type: number
    sql: ${bot_count} - ${false_bot_count} ;;
    value_format_name: decimal_0
    drill_fields: [default*]
    label: "bad bot count"
  }


  measure: avg_rps_15m {
    type: number
    sql: count(*) / (60*15) ;;
    value_format_name: decimal_0
    drill_fields: [default*]
    label: "total requests in rps"
  }

  measure: origin_rps_15m {
    type: number
    sql: count(${is_origin}) / (60*15) ;;
    value_format_name: decimal_0
    drill_fields: [default*]
    label: "origin requests in rps"
  }

  measure: cached_rps_15m {
    type: number
    sql: count(${is_cached_r}) / (60*15) ;;
    value_format_name: decimal_0
    drill_fields: [default*]
    label: "cached requests in rps"
  }

  measure: not_cached_rps_15m {
    type: number
    sql: count(${is_not_cached_r}) / (60*15) ;;
    value_format_name: decimal_0
    drill_fields: [default*]
    label: "uncached requests in rps"
  }

  measure: percentile99_originresponsetime {
    type: percentile
    percentile: 99
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "p99"
  }

  measure: percentile95_originresponsetime {
    type: percentile
    percentile: 95
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "p95"
  }

  measure: percentile75_originresponsetime {
    type: percentile
    percentile: 75
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "p75"
  }

  measure: percentile50_originresponsetime {
    type: percentile
    percentile: 50
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "p50"
  }

  measure: percentile999_originresponsetime {
    type: percentile
    percentile: 99.9
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "p999"
  }

  measure: avg_originresponsetime {
    type: average
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "avg"
  }

  measure: waittime_originresponsetime {
    type: sum
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "WaitTimePerSecond"
  }

  measure: max_originresponsetime {
    type: max
    sql:  ${TABLE}.OriginResponseTime/1e6 ;;
    value_format: "0.00 \" ms\""
    label: "max"
  }

  measure: threat_count {
    type: count
    filters: {
      field: is_threat
      value: "yes"
    }
    drill_fields: [default*]
    }

  measure: cached_count {
    type: count
    filters: {
      field: is_cached_r
      value: "yes"
    }
    drill_fields: [default*]
  }

  measure: uncached_count {
    type: count
    filters: {
      field: is_not_cached_r
      value: "yes"
    }
    drill_fields: [default*]
  }

  measure: count_edge_requests {
    type: count
    drill_fields: [default*]
  }

  measure: count_origin_requests {
    type: count
    filters: {
      field: is_origin
      value: "yes"
    }
    drill_fields: [default*]
  }

  measure: total_bandwidth {
    type: sum
    sql: ${edge_response_bytes} ;;
    value_format: "[>=1099511627776]0.00,,,,\" TB\";[>=1073741824]0.00,,,\" GB\";[>=1048576]0.00,,\" MB\""
    html: {% if value > 1099511627776 %} {{ value | divided_by: 1099511627776.0 | round: 2}} TB
          {% elsif value > 1073741824 %} {{ value | divided_by: 1073741824.0 | round: 2}} GB
          {% elsif value > 1048576 %} {{ value | divided_by: 1048576.0 | round: 2}} MB
          {% elsif value > 1024 %} {{ value | divided_by: 1024.0 | round: 2}} KB
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }

  measure: average_total_bandwidth {
    type: average
    sql: ${edge_response_bytes} ;;
     value_format: "[>=1099511627776]0.00,,,,\" TB\";[>=1073741824]0.00,,,\" GB\";[>=1048576]0.00,,\" MB\""
    html: {% if value > 1000000000000 %} {{ value | divided_by: 1000000000000.0 | round: 2}} Tbps
          {% elsif value > 1000000000 %} {{ value | divided_by: 1000000000.0 | round: 2}} Gbps
          {% elsif value > 1000000 %} {{ value | divided_by: 1000000.0 | round: 2}} Mbps
          {% elsif value > 1000 %} {{ value | divided_by: 1000.0 | round: 2}} Kbps
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }

  measure: saved_bandwidth {
    type: sum
    sql: ${edge_response_bytes} ;;
    filters: {
      field: is_cached_b
      value: "yes"
    }
    value_format: "[>=1099511627776]0.00,,,,\" TB\";[>=1073741824]0.00,,,\" GB\";[>=1048576]0.00,,\" MB\""
    html: {% if value > 1099511627776 %} {{ value | divided_by: 1099511627776.0 | round: 2}} TB
          {% elsif value > 1073741824 %} {{ value | divided_by: 1073741824.0 | round: 2}} GB
          {% elsif value > 1048576 %} {{ value | divided_by: 1048576.0 | round: 2}} MB
          {% elsif value > 1024 %} {{ value | divided_by: 1024.0 | round: 2}} KB
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }

  measure: average_saved_bandwidth {
    type: average
    sql: ${edge_response_bytes} ;;
    filters: {
      field: is_cached_b
      value: "yes"
    }
     value_format: "[>=1099511627776]0.00,,,,\" TB\";[>=1073741824]0.00,,,\" GB\";[>=1048576]0.00,,\" MB\""
    html: {% if value > 1000000000000 %} {{ value | divided_by: 1000000000000.0 | round: 2}} Tbps
          {% elsif value > 1000000000 %} {{ value | divided_by: 1000000000.0 | round: 2}} Gbps
          {% elsif value > 1000000 %} {{ value | divided_by: 1000000.0 | round: 2}} Mbps
          {% elsif value > 1000 %} {{ value | divided_by: 1000.0 | round: 2}} Kbps
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }

  measure: saved_bandwidth_percentage {
    type:  number
    sql: ${saved_bandwidth} / ${total_bandwidth};;
    value_format_name: percent_2
  }

  measure: uncached_bandwidth {
    type: sum
    sql: ${edge_response_bytes} ;;
    filters: {
      field: is_not_cached_b
      value: "yes"
    }
    value_format: "[>=1000000000]0.0,,,\"e9\";[>=1000000]0.0,,,\"e6\";[>=1000]0.0,,,\"e3 \";0.00"
    html: {% if value > 1099511627776 %} {{ value | divided_by: 1099511627776.0 | round: 2}} TiB
          {% elsif value > 1073741824 %} {{ value | divided_by: 1073741824.0 | round: 2}} GiB
          {% elsif value > 1048576 %} {{ value | divided_by: 1048576.0 | round: 2}} MiB
          {% elsif value > 1024 %} {{ value | divided_by: 1024.0 | round: 2}} KiB
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }


  measure: average_uncached_bandwidth {
    type: average
    sql: ${edge_response_bytes} ;;
    filters: {
      field: is_not_cached_b
      value: "yes"
    }
     value_format: "[>=1099511627776]0.00,,,,\" TB\";[>=1073741824]0.00,,,\" GB\";[>=1048576]0.00,,\" MB\""
    html: {% if value > 1000000000000 %} {{ value | divided_by: 1000000000000.0 | round: 2}} Tbps
          {% elsif value > 1000000000 %} {{ value | divided_by: 1000000000.0 | round: 2}} Gbps
          {% elsif value > 1000000 %} {{ value | divided_by: 1000000.0 | round: 2}} Mbps
          {% elsif value > 1000 %} {{ value | divided_by: 1000.0 | round: 2}} Kbps
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }

  measure: uncached_bandwidth_percentage {
    type:  number
    sql: ${uncached_bandwidth} / ${total_bandwidth};;
    value_format_name: percent_2
  }

  measure: edge_avg_repsonse_time {
    type: average
    sql: ${edge_response_time} ;;
    group_label: "Edge"
  }

  measure: origin_avg_repsonse_time {
    type: average
    sql: ${origin_response_time} ;;
    group_label: "Origin"
  }

  measure: origin_bandwidth {
    type:  sum
    sql: ${edge_response_bytes};;
    filters: {
      field: is_origin
      value: "yes"
      }
    value_format: "[>=1000000000]0.0,,,\"e9\";[>=1000000]0.0,,,\"e6\";[>=1000]0.0,,,\"e3 \";0.00"
    html: {% if value > 1099511627776 %} {{ value | divided_by: 1099511627776.0 | round: 2}} TB
          {% elsif value > 1073741824 %} {{ value | divided_by: 1073741824.0 | round: 2}} GB
          {% elsif value > 1048576 %} {{ value | divided_by: 1048576.0 | round: 2}} MB
          {% elsif value > 1024 %} {{ value | divided_by: 1024.0 | round: 2}} KB
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }

  measure: average_origin_bandwidth {
    type: average
    sql: ${edge_response_bytes} ;;
    filters: {
      field: is_origin
      value: "yes"
    }
    value_format: "[>=1099511627776]0.00,,,,\" TB\";[>=1073741824]0.00,,,\" GB\";[>=1048576]0.00,,\" MB\""
    html: {% if value > 1000000000000 %} {{ value | divided_by: 1000000000000.0 | round: 2}} Tbps
          {% elsif value > 1000000000 %} {{ value | divided_by: 1000000000.0 | round: 2}} Gbps
          {% elsif value > 1000000 %} {{ value | divided_by: 1000000.0 | round: 2}} Mbps
          {% elsif value > 1000 %} {{ value | divided_by: 1000.0 | round: 2}} Kbps
          {% else %} {{value | round: 2}} bytes {% endif %} ;;
  }


#########################################################################################
################################    DRILL SETS    #######################################
#########################################################################################

  set: default {
    fields: [
      client_ip,
      edge_start_timestamp_raw,
      client_country_code,
      client_device_type,
      edge_response_status,
      edge_response_bytes
      ]
  }
}
