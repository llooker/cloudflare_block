connection: "bq-cfanalytics"

# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard.lookml"

datagroup: cloudflare_looker_default_datagroup {
#   sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cloudflare_looker_default_datagroup

explore: cloudflare_logs {
  cancel_grouping_fields: [cloudflare_logs.firewall_matches_actions, cloudflare_logs.firewall_matches_rule_ids, cloudflare_logs.firewall_matches_sources]
  view_name: cloudflare_logs
  join: firewall_matches {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${cloudflare_logs.ray_id} = ${firewall_matches.ray_id};;
  }

  join: countries {
    relationship: one_to_one
    sql_on: ${cloudflare_logs.client_country_code} = ${countries.country_code} ;;
  }

  join: events_per_second {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cloudflare_logs.edge_start_timestamp_second} = ${events_per_second.time_seconds_key};;
  }

  join: current_second_stats {
    type: cross
    relationship: one_to_one
 #   sql_on: ${cloudflare_logs.edge_start_timestamp_second} = ${current_second_stats.current_second} ;;
  }
}

#explore: cloudflare_logs {
#  cancel_grouping_fields: [cloudflare_logs.firewall_matches_actions, cloudflare_logs.firewall_matches_rule_ids, cloudflare_logs.firewall_matches_sources]
#  view_name: cloudflare_logs
#  join: firewall_matches {
#    type: left_outer
#    relationship: one_to_many
#    sql_on:  ${cloudflare_logs.ray_id} = ${firewall_matches.ray_id};;
#  }
#}


explore: events_per_second {}
explore: current_second_stats {}
