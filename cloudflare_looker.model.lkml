connection: "bigquery_camiliame"

# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard.lookml"

datagroup: camilia_looker_default_datagroup {
#   sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: camilia_looker_default_datagroup

explore: cloudflare_logs {

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



explore: events_per_second {}

explore: current_second_stats {}
