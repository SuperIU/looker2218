view: asklooker_index_config {
  sql_table_name: gcpl2218.asklooker_index_config ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cron {
    type: string
    sql: ${TABLE}.cron ;;
  }

  dimension: metadata_config_id {
    type: string
    sql: ${TABLE}.metadata_config_id ;;
  }

  dimension_group: next_run {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.next_run_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, asklooker_index_execution_history.count]
  }
}
