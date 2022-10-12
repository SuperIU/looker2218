view: lookml_dashboard_metadata_v2 {
  sql_table_name: gcpl2218.lookml_dashboard_metadata_v2 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: content_metadata_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.content_metadata_id ;;
  }

  dimension: dashboard_name {
    type: string
    sql: ${TABLE}.dashboard_name ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: space_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.space_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      model_name,
      dashboard_name,
      project_name,
      space.id,
      space.name,
      content_metadata.id
    ]
  }
}
