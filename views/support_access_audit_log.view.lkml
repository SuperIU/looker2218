view: support_access_audit_log {
  sql_table_name: gcpl2218.support_access_audit_log ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: action_data {
    type: string
    sql: ${TABLE}.action_data ;;
  }

  dimension: admin_user_email {
    type: string
    sql: ${TABLE}.admin_user_email ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
