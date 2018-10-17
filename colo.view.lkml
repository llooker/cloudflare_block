view: colo {
  sql_table_name: cloudflare_logs.colo ;;

  dimension: colo_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.colo_id ;;
  }

  dimension: colo_city {
    type: string
    sql: ${TABLE}.colo_city ;;
  }

  dimension: colo_state {
    type: string
    sql: ${TABLE}.colo_state ;;
  }

  measure: count {
    type: count
    drill_fields: [colo_id]
  }
}
