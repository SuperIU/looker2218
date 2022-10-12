view: api_usage {
  sql_table_name: gcpl2218.api_usage ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: count_api_usage {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_date ;;
  }

  dimension: endpoint {
    type: string
    sql: ${TABLE}.endpoint ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
