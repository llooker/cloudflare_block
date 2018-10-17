view: origin_response_time_quantiles {
  derived_table: {
    sql: SELECT
        camiliame_logs.EdgeStartTimestamp AS EdgeStartTimestamp,
        FORMAT_TIMESTAMP('%F %H:%M', TIMESTAMP_TRUNC(TIMESTAMP_SECONDS((UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ) - MOD(UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ), (60*15)))), MINUTE)) AS camiliame_logs_edge_start_timestamp_minute15,
        PERCENTILE_CONT(OriginResponseTime/1000000, 0.999) OVER(PARTITION BY TIMESTAMP_TRUNC(TIMESTAMP_SECONDS((UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ) - MOD(UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ), (60*15)))), MINUTE)) AS p999,
        PERCENTILE_CONT(OriginResponseTime/1000000, 0.99) OVER(PARTITION BY  TIMESTAMP_TRUNC(TIMESTAMP_SECONDS((UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ) - MOD(UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ), (60*15)))), MINUTE)) AS p99,
        PERCENTILE_CONT(OriginResponseTime/1000000, 0.95) OVER(PARTITION BY  TIMESTAMP_TRUNC(TIMESTAMP_SECONDS((UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ) - MOD(UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ), (60*15)))), MINUTE)) AS p95,
        PERCENTILE_CONT(OriginResponseTime/1000000, 0.90) OVER(PARTITION BY  TIMESTAMP_TRUNC(TIMESTAMP_SECONDS((UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ) - MOD(UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ), (60*15)))), MINUTE)) AS p90,
        PERCENTILE_CONT(OriginResponseTime/1000000, 0.75) OVER(PARTITION BY  TIMESTAMP_TRUNC(TIMESTAMP_SECONDS((UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ) - MOD(UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ), (60*15)))), MINUTE)) AS p75,
        PERCENTILE_CONT(OriginResponseTime/1000000, 0.50) OVER(PARTITION BY  TIMESTAMP_TRUNC(TIMESTAMP_SECONDS((UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ) - MOD(UNIX_SECONDS(camiliame_logs.EdgeStartTimestamp ), (60*15)))), MINUTE)) AS p50
      FROM cloudflare_logs.camiliame_logs  AS camiliame_logs
      ORDER BY 1 DESC
       ;;

#       persist_for: "168 hours"
  }

  measure: count {
    type: count
  }

  # Join on this
  dimension_group: EdgeStartTimestamp {
    type: time
    timeframes: [
      raw,
      second
    ]
    sql: ${TABLE}.EdgeStartTimestamp ;;
  }

  dimension: camiliame_logs_edge_start_timestamp_minute15 {
    type: string
    sql: ${TABLE}.camiliame_logs_edge_start_timestamp_minute15 ;;
  }

  dimension: p999_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}.p999 ;;
  }

  dimension: p99_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}.p99 ;;
  }

  dimension: p95_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}.p95 ;;
  }

  dimension: p90_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}.p90 ;;
  }

  dimension: p75_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}.p75 ;;
  }

  dimension: p50_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}.p50 ;;
  }

  measure: p999 {
    type: max
    sql: ${p999_dimension} ;;
  #  value_format_name: decimal_2
    value_format: "0.00 \" s\""
  }

  measure: p99 {
    type: max
    sql: ${p99_dimension} ;;
  #  value_format_name: decimal_2
    value_format: "0.00 \" s\""

  }

  measure: p95 {
    type: max
    sql: ${p95_dimension} ;;
  #  value_format_name: decimal_2
    value_format: "0.00 \" s\""
  }

  measure: p90 {
    type: max
    sql: ${p90_dimension} ;;
  # value_format_name: decimal_2
    value_format: "0.00 \" s\""
  }

  measure: p75 {
    type: max
    sql: ${p75_dimension} ;;
  #  value_format_name: decimal_2
    value_format: "0.00 \" s\""
  }

  measure: p50 {
    type: max
#     sql: ROUND(${p50_dimension}, 2) ;;
    sql: ${p50_dimension} ;;
  #  value_format_name: decimal_2
    value_format: "0.00 \" s\""
  }

}
