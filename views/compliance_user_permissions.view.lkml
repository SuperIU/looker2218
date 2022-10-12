view: compliance_user_permissions {
  sql_table_name: gcpl2218.compliance_user_permissions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: access_data {
    type: number
    sql: ${TABLE}.access_data ;;
  }

  dimension: administer {
    type: number
    sql: ${TABLE}.administer ;;
  }

  dimension: can_copy_print {
    type: number
    sql: ${TABLE}.can_copy_print ;;
  }

  dimension: can_create_forecast {
    type: number
    sql: ${TABLE}.can_create_forecast ;;
  }

  dimension: clear_cache_refresh {
    type: number
    sql: ${TABLE}.clear_cache_refresh ;;
  }

  dimension: create_alerts {
    type: number
    sql: ${TABLE}.create_alerts ;;
  }

  dimension: create_custom_fields {
    type: number
    sql: ${TABLE}.create_custom_fields ;;
  }

  dimension: create_prefetches {
    type: number
    sql: ${TABLE}.create_prefetches ;;
  }

  dimension: create_public_looks {
    type: number
    sql: ${TABLE}.create_public_looks ;;
  }

  dimension: create_table_calculations {
    type: number
    sql: ${TABLE}.create_table_calculations ;;
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

  dimension: deploy {
    type: number
    sql: ${TABLE}.deploy ;;
  }

  dimension: develop {
    type: number
    sql: ${TABLE}.develop ;;
  }

  dimension: download_with_limit {
    type: number
    sql: ${TABLE}.download_with_limit ;;
  }

  dimension: download_without_limit {
    type: number
    sql: ${TABLE}.download_without_limit ;;
  }

  dimension: embed {
    type: yesno
    sql: ${TABLE}.embed ;;
  }

  dimension: embed_browse_spaces {
    type: number
    sql: ${TABLE}.embed_browse_spaces ;;
  }

  dimension: embed_save_shared_space {
    type: number
    sql: ${TABLE}.embed_save_shared_space ;;
  }

  dimension: explore {
    type: number
    sql: ${TABLE}.explore ;;
  }

  dimension: follow_alerts {
    type: number
    sql: ${TABLE}.follow_alerts ;;
  }

  dimension: login_special_email {
    type: number
    sql: ${TABLE}.login_special_email ;;
  }

  dimension: manage_homepage {
    type: number
    sql: ${TABLE}.manage_homepage ;;
  }

  dimension: manage_models {
    type: number
    sql: ${TABLE}.manage_models ;;
  }

  dimension: manage_spaces {
    type: number
    sql: ${TABLE}.manage_spaces ;;
  }

  dimension: manage_stereo {
    type: number
    sql: ${TABLE}.manage_stereo ;;
  }

  dimension: mobile_app_access {
    type: number
    sql: ${TABLE}.mobile_app_access ;;
  }

  dimension: permissions {
    type: string
    sql: ${TABLE}.permissions ;;
  }

  dimension: save_content {
    type: number
    sql: ${TABLE}.save_content ;;
  }

  dimension: schedule_external_look_emails {
    type: number
    sql: ${TABLE}.schedule_external_look_emails ;;
  }

  dimension: schedule_look_emails {
    type: number
    sql: ${TABLE}.schedule_look_emails ;;
  }

  dimension: see_alerts {
    type: number
    sql: ${TABLE}.see_alerts ;;
  }

  dimension: see_datagroups {
    type: number
    sql: ${TABLE}.see_datagroups ;;
  }

  dimension: see_drill_overlay {
    type: number
    sql: ${TABLE}.see_drill_overlay ;;
  }

  dimension: see_logs {
    type: number
    sql: ${TABLE}.see_logs ;;
  }

  dimension: see_lookml {
    type: number
    sql: ${TABLE}.see_lookml ;;
  }

  dimension: see_lookml_dashboards {
    type: number
    sql: ${TABLE}.see_lookml_dashboards ;;
  }

  dimension: see_looks {
    type: number
    sql: ${TABLE}.see_looks ;;
  }

  dimension: see_pdts {
    type: number
    sql: ${TABLE}.see_pdts ;;
  }

  dimension: see_queries {
    type: number
    sql: ${TABLE}.see_queries ;;
  }

  dimension: see_schedules {
    type: number
    sql: ${TABLE}.see_schedules ;;
  }

  dimension: see_sql {
    type: number
    sql: ${TABLE}.see_sql ;;
  }

  dimension: see_system_activity {
    type: number
    sql: ${TABLE}.see_system_activity ;;
  }

  dimension: see_user_dashboards {
    type: number
    sql: ${TABLE}.see_user_dashboards ;;
  }

  dimension: see_users {
    type: number
    sql: ${TABLE}.see_users ;;
  }

  dimension: send_outgoing_webhook {
    type: number
    sql: ${TABLE}.send_outgoing_webhook ;;
  }

  dimension: send_to_integration {
    type: number
    sql: ${TABLE}.send_to_integration ;;
  }

  dimension: send_to_s3 {
    type: number
    sql: ${TABLE}.send_to_s3 ;;
  }

  dimension: send_to_sftp {
    type: number
    sql: ${TABLE}.send_to_sftp ;;
  }

  dimension: sudo {
    type: number
    sql: ${TABLE}.sudo ;;
  }

  dimension: support_access_toggle {
    type: number
    sql: ${TABLE}.support_access_toggle ;;
  }

  dimension: update_datagroups {
    type: number
    sql: ${TABLE}.update_datagroups ;;
  }

  dimension: use_sql_runner {
    type: number
    sql: ${TABLE}.use_sql_runner ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
