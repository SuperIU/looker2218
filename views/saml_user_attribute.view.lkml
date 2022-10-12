view: saml_user_attribute {
  sql_table_name: gcpl2218.saml_user_attribute ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: required {
    type: yesno
    sql: ${TABLE}.required ;;
  }

  dimension: saml_config_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.saml_config_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      saml_config.id,
      saml_config.user_attribute_map_first_name,
      saml_config.user_attribute_map_last_name,
      saml_user_attribute_attribute.count
    ]
  }
}
