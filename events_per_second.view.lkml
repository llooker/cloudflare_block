view: events_per_second {
  derived_table: {
    sql:
    SELECT
        TIMESTAMP_TRUNC(EdgeStartTimestamp, SECOND) AS time_seconds,
        COUNT(*) AS events_per_second_count
     FROM
        cloudflare_data.cf_analytics_logs
     GROUP BY 1
     ORDER BY 2 DESC
       ;;
#       persist_for: "168 hours"
  }

  measure: avg_events_per_second {
    type: average
    sql: ${events_per_second_count} ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: min_events_per_second {
    type: min
    sql: ${events_per_second_count} ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: max_events_per_second {
    type: max
    sql: ${events_per_second_count} ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  # Add Current events per second

  dimension: time_seconds_key {
    primary_key: yes
    type: date_time
    sql: ${TABLE}.time_seconds ;;
#     hidden: yes
  }

  dimension_group: time_seconds {
    type: time
    sql: ${TABLE}.time_seconds ;;
    hidden: yes
  }

  dimension: events_per_second_count {
    type: number
    sql: ${TABLE}.events_per_second_count ;;
  }


  set: detail {
    fields: [time_seconds_time, events_per_second_count]
  }
}