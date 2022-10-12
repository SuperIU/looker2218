view: pdt_build_catalog {
  sql_table_name: gcpl2218.pdt_build_catalog ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: build_began_at {
    type: number
    sql: ${TABLE}.build_began_at ;;
  }

  dimension: build_duration {
    type: number
    sql: ${TABLE}.build_duration ;;
  }

  dimension: build_error {
    type: string
    sql: ${TABLE}.build_error ;;
  }

  dimension: build_new_trigger_value {
    type: string
    sql: ${TABLE}.build_new_trigger_value ;;
  }

  dimension: build_old_trigger_value {
    type: string
    sql: ${TABLE}.build_old_trigger_value ;;
  }

  dimension: build_reason {
    type: string
    sql: ${TABLE}.build_reason ;;
  }

  dimension: built_at {
    type: number
    sql: ${TABLE}.built_at ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: last_build_sql {
    type: string
    sql: ${TABLE}.last_build_sql ;;
  }

  dimension: num_builds {
    type: number
    sql: ${TABLE}.num_builds ;;
  }

  dimension: num_failed {
    type: number
    sql: ${TABLE}.num_failed ;;
  }

  dimension: record_updated_at {
    type: number
    sql: ${TABLE}.record_updated_at ;;
  }

  dimension: total_duration {
    type: number
    sql: ${TABLE}.total_duration ;;
  }

  dimension: trigger_at {
    type: number
    sql: ${TABLE}.trigger_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
