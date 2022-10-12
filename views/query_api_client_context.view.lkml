view: query_api_client_context {
  sql_table_name: gcpl2218.query_api_client_context ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: attribute0 {
    type: string
    sql: ${TABLE}.attribute0 ;;
  }

  dimension: attribute1 {
    type: string
    sql: ${TABLE}.attribute1 ;;
  }

  dimension: attribute2 {
    type: string
    sql: ${TABLE}.attribute2 ;;
  }

  dimension: attribute3 {
    type: string
    sql: ${TABLE}.attribute3 ;;
  }

  dimension: attribute4 {
    type: string
    sql: ${TABLE}.attribute4 ;;
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

  dimension: extra_attributes {
    type: string
    sql: ${TABLE}.extra_attributes ;;
  }

  dimension: history_slug {
    type: string
    sql: ${TABLE}.history_slug ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
