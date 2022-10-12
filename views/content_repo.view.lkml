view: content_repo {
  sql_table_name: gcpl2218.content_repo ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: deploy_secret {
    type: string
    sql: ${TABLE}.deploy_secret ;;
  }

  dimension: git_password {
    type: string
    sql: ${TABLE}.git_password ;;
  }

  dimension: git_server_port {
    type: number
    sql: ${TABLE}.git_server_port ;;
  }

  dimension: git_server_scheme {
    type: string
    sql: ${TABLE}.git_server_scheme ;;
  }

  dimension: git_service_name {
    type: string
    sql: ${TABLE}.git_service_name ;;
  }

  dimension: git_username {
    type: string
    sql: ${TABLE}.git_username ;;
  }

  dimension: instance_name {
    type: string
    sql: ${TABLE}.instance_name ;;
  }

  dimension: repo_url {
    type: string
    sql: ${TABLE}.repo_url ;;
  }

  dimension: use_git_cookie_auth {
    type: yesno
    sql: ${TABLE}.use_git_cookie_auth ;;
  }

  measure: count {
    type: count
    drill_fields: [id, instance_name, git_service_name, git_username]
  }
}
