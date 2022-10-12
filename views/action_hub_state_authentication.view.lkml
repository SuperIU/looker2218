view: action_hub_state_authentication {
  sql_table_name: gcpl2218.action_hub_state_authentication ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: created_at {
    type: number
    sql: ${TABLE}.created_at ;;
  }

  dimension: encrypted_auth_token {
    type: string
    sql: ${TABLE}.encrypted_auth_token ;;
  }

  dimension: expires_at {
    type: number
    sql: ${TABLE}.expires_at ;;
  }

  dimension: lookup_id {
    type: string
    sql: ${TABLE}.lookup_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_state_id {
    type: number
    sql: ${TABLE}.user_state_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user.first_name, user.last_name, user.dev_mode_user_id, user.dev_branch_name]
  }
}
