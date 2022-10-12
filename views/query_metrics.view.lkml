view: query_metrics {
  sql_table_name: gcpl2218.query_metrics ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: acquire_connection {
    type: number
    sql: ${TABLE}.acquire_connection ;;
  }

  dimension: artifact_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.artifact_id ;;
  }

  dimension: artifact_type {
    type: string
    sql: ${TABLE}.artifact_type ;;
  }

  dimension: async_processing {
    type: number
    sql: ${TABLE}.async_processing ;;
  }

  dimension: cache_load {
    type: number
    sql: ${TABLE}.cache_load ;;
  }

  dimension: connection_held {
    type: number
    sql: ${TABLE}.connection_held ;;
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

  dimension: execute_extents_query {
    type: number
    sql: ${TABLE}.execute_extents_query ;;
  }

  dimension: execute_fill_max_query {
    type: number
    sql: ${TABLE}.execute_fill_max_query ;;
  }

  dimension: execute_fill_min_query {
    type: number
    sql: ${TABLE}.execute_fill_min_query ;;
  }

  dimension: execute_fill_pivot_max_query {
    type: number
    sql: ${TABLE}.execute_fill_pivot_max_query ;;
  }

  dimension: execute_fill_pivot_min_query {
    type: number
    sql: ${TABLE}.execute_fill_pivot_min_query ;;
  }

  dimension: execute_grand_totals_query {
    type: number
    sql: ${TABLE}.execute_grand_totals_query ;;
  }

  dimension: execute_main_query {
    type: number
    sql: ${TABLE}.execute_main_query ;;
  }

  dimension: execute_row_totals_query {
    type: number
    sql: ${TABLE}.execute_row_totals_query ;;
  }

  dimension: execute_sql {
    type: number
    sql: ${TABLE}.execute_sql ;;
  }

  dimension: execute_totals_query {
    type: number
    sql: ${TABLE}.execute_totals_query ;;
  }

  dimension: explore_init {
    type: number
    sql: ${TABLE}.explore_init ;;
  }

  dimension: explore_init_mode {
    type: string
    sql: ${TABLE}.explore_init_mode ;;
  }

  dimension: extra_fields_json {
    type: string
    sql: ${TABLE}.extra_fields_json ;;
  }

  dimension: history_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.history_id ;;
  }

  dimension: load_extents_query_in_memory {
    type: number
    sql: ${TABLE}.load_extents_query_in_memory ;;
  }

  dimension: load_fill_max_query_in_memory {
    type: number
    sql: ${TABLE}.load_fill_max_query_in_memory ;;
  }

  dimension: load_fill_min_query_in_memory {
    type: number
    sql: ${TABLE}.load_fill_min_query_in_memory ;;
  }

  dimension: load_fill_pivot_max_query_in_memory {
    type: number
    sql: ${TABLE}.load_fill_pivot_max_query_in_memory ;;
  }

  dimension: load_fill_pivot_min_query_in_memory {
    type: number
    sql: ${TABLE}.load_fill_pivot_min_query_in_memory ;;
  }

  dimension: load_grand_totals_query_in_memory {
    type: number
    sql: ${TABLE}.load_grand_totals_query_in_memory ;;
  }

  dimension: load_main_query_in_memory {
    type: number
    sql: ${TABLE}.load_main_query_in_memory ;;
  }

  dimension: load_process_and_stream_main_query {
    type: number
    sql: ${TABLE}.load_process_and_stream_main_query ;;
  }

  dimension: load_row_totals_query_in_memory {
    type: number
    sql: ${TABLE}.load_row_totals_query_in_memory ;;
  }

  dimension: load_totals_query_in_memory {
    type: number
    sql: ${TABLE}.load_totals_query_in_memory ;;
  }

  dimension: model_init {
    type: number
    sql: ${TABLE}.model_init ;;
  }

  dimension: model_init_mode {
    type: string
    sql: ${TABLE}.model_init_mode ;;
  }

  dimension: pdt {
    type: number
    sql: ${TABLE}.pdt ;;
  }

  dimension: per_user_throttler {
    type: number
    sql: ${TABLE}.per_user_throttler ;;
  }

  dimension: post_processing {
    type: number
    sql: ${TABLE}.post_processing ;;
  }

  dimension: prepare {
    type: number
    sql: ${TABLE}.prepare ;;
  }

  dimension: project_init {
    type: number
    sql: ${TABLE}.project_init ;;
  }

  dimension: query_task_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.query_task_id ;;
  }

  dimension: queued {
    type: number
    sql: ${TABLE}.queued ;;
  }

  dimension: stream_to_cache {
    type: number
    sql: ${TABLE}.stream_to_cache ;;
  }

  dimension: temporary_dt {
    type: number
    sql: ${TABLE}.temporary_dt ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      history.id,
      history.connection_name,
      query_task.id,
      query_task.connection_name,
      artifact.id
    ]
  }
}
