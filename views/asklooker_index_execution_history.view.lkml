view: asklooker_index_execution_history {
  sql_table_name: gcpl2218.asklooker_index_execution_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: asklooker_index_config_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.asklooker_index_config_id ;;
  }

  dimension: chunk_id {
    type: string
    sql: ${TABLE}.chunk_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, asklooker_index_config.id]
  }
}
