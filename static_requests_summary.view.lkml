view: static_requests_summary {
  derived_table: {
    sql:
            WITH origin_response_time_quantiles AS (SELECT
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
                   )

            SELECT
              "p95" AS percentile,
              MAX(p95) AS max,
              ROUND(AVG(p95), 2) AS avg,
                (SELECT p95 FROM origin_response_time_quantiles WHERE EdgeStartTimestamp = (SELECT MAX(EdgeStartTimestamp) FROM origin_response_time_quantiles)) AS current_second
            FROM cloudflare_logs.camiliame_logs  AS camiliame_logs
            LEFT JOIN origin_response_time_quantiles ON (FORMAT_TIMESTAMP('%F %T', TIMESTAMP_TRUNC(camiliame_logs.EdgeStartTimestamp, SECOND) )) = (FORMAT_TIMESTAMP('%F %T', origin_response_time_quantiles.EdgeStartTimestamp ))
            WHERE camiliame_logs.CacheCacheStatus NOT IN ("bypass", "unknown")
            UNION ALL

            SELECT
              "p75" AS percentile,
              MAX(p75) AS max,
              ROUND(AVG(p75), 2) AS avg,
                (SELECT p75 FROM origin_response_time_quantiles WHERE EdgeStartTimestamp =
                  (SELECT MAX(EdgeStartTimestamp) FROM origin_response_time_quantiles)
                ) AS current_second
            FROM cloudflare_logs.camiliame_logs  AS camiliame_logs
            LEFT JOIN origin_response_time_quantiles ON (FORMAT_TIMESTAMP('%F %T', TIMESTAMP_TRUNC(camiliame_logs.EdgeStartTimestamp, SECOND) )) = (FORMAT_TIMESTAMP('%F %T', origin_response_time_quantiles.EdgeStartTimestamp ))
            WHERE camiliame_logs.CacheCacheStatus NOT IN ("bypass", "unknown")

            UNION ALL

            SELECT
              "p50" AS percentile,
              MAX(p50) AS max,
              ROUND(AVG(p50), 2) AS avg,
              (SELECT p50 FROM origin_response_time_quantiles WHERE EdgeStartTimestamp = (SELECT MAX(EdgeStartTimestamp) FROM origin_response_time_quantiles)) AS current_second
            FROM cloudflare_logs.camiliame_logs  AS camiliame_logs
            LEFT JOIN origin_response_time_quantiles ON (FORMAT_TIMESTAMP('%F %T', TIMESTAMP_TRUNC(camiliame_logs.EdgeStartTimestamp, SECOND) )) = (FORMAT_TIMESTAMP('%F %T', origin_response_time_quantiles.EdgeStartTimestamp ))
            WHERE camiliame_logs.CacheCacheStatus NOT IN ("bypass", "unknown")
             ;;
  }

  dimension: percentile {
    type: string
    sql: ${TABLE}.percentile ;;
  }

  dimension: max {
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: avg {
    type: number
    sql: ${TABLE}.avg ;;
  }

  dimension: current_second {
    type: number
    sql: ${TABLE}.current_second ;;
  }

  set: detail {
    fields: [percentile, max, avg, current_second]
  }
}
