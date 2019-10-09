view: firewall_matches {
  derived_table: {
    sql: SELECT RayID, pos1, pos2, pos3, FirewallMatchesActions, FirewallMatchesRuleIDs, FirewallMatchesSources
      FROM `cloudflare-se-analytics.cloudflare_data.cf_analytics_logs`,
      UNNEST(FirewallMatchesActions) FirewallMatchesActions WITH OFFSET pos1,
      UNNEST(FirewallMatchesRuleIDs) FirewallMatchesRuleIDs WITH OFFSET pos2,
      UNNEST(FirewallMatchesSources) FirewallMatchesSources WITH OFFSET pos3
      WHERE pos1 = pos2
      AND   pos2 = pos3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ray_id {
    type: string
    sql: ${TABLE}.RayID ;;
  }

  dimension: pos1 {
    type: number
    sql: ${TABLE}.pos1 ;;
  }

  dimension: pos2 {
    type: number
    sql: ${TABLE}.pos2 ;;
  }

  dimension: pos3 {
    type: number
    sql: ${TABLE}.pos3 ;;
  }

  dimension: firewall_matches_actions {
    type: string
    sql: ${TABLE}.FirewallMatchesActions ;;
  }

  dimension: firewall_matches_rule_ids {
    type: string
    sql: ${TABLE}.FirewallMatchesRuleIDs ;;
  }

  dimension: firewall_matches_sources {
    type: string
    sql: ${TABLE}.FirewallMatchesSources ;;
  }

  set: detail {
    fields: [
      ray_id,
      firewall_matches_actions,
      firewall_matches_rule_ids,
      firewall_matches_sources
    ]
  }
}
