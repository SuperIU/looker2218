view: active_pdt_materialize_task {
  sql_table_name: gcpl2218.active_pdt_materialize_task ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: connection {
    type: string
    sql: ${TABLE}.connection ;;
  }

  dimension: created_at {
    type: number
    sql: ${TABLE}.created_at ;;
  }

  dimension: finished_at {
    type: number
    sql: ${TABLE}.finished_at ;;
  }

  dimension: force_full_incremental {
    type: string
    sql: ${TABLE}.force_full_incremental ;;
  }

  dimension: force_rebuild {
    type: string
    sql: ${TABLE}.force_rebuild ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: node_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.node_id ;;
  }

  dimension: query_slug {
    type: string
    sql: ${TABLE}.query_slug ;;
  }

  dimension: started_at {
    type: number
    sql: ${TABLE}.started_at ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.view_name ;;
  }

  dimension: workspace {
    type: string
    sql: ${TABLE}.workspace ;;
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
      view_name,
      node.hostname,
      node.prev_node_id,
      user.first_name,
      user.last_name,
      user.dev_mode_user_id,
      user.dev_branch_name
    ]
  }
}
