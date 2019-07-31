view: current_second_stats {
  derived_table: {
    sql: select max(TIMESTAMP_TRUNC(edgestarttimestamp, SECOND)) as current_second,
                avg(edgeresponsebytes) as current_bps,
                count(*) as current_ops
        from cf_analytics_logs
        where TIMESTAMP_TRUNC(edgestarttimestamp, SECOND) = (SELECT max(TIMESTAMP_TRUNC(edgestarttimestamp, SECOND)) from cf_analytics_logs)
             ;;
#     persist_for: "168 hours"
  }

  dimension: current_second {
    type: date_time
    sql: ${TABLE}.current_second ;;
  }

  dimension: current_bps {
    type: number
    sql: COALESCE(${TABLE}.current_bps, 0) ;;
  }

  dimension: current_ops {
    type: number
    sql: COALESCE(${TABLE}.current_ops, 0) ;;
  }

  set: detail {
    fields: [current_second, current_bps, current_ops]
  }
}