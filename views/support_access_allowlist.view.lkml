view: support_access_allowlist {
  sql_table_name: gcpl2218.support_access_allowlist ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: added_by_admin_user_id {
    type: number
    sql: ${TABLE}.added_by_admin_user_id ;;
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  measure: count {
    type: count
    drill_fields: [id, full_name]
  }
}
