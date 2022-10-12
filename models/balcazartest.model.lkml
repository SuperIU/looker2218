connection: "looker"

# include all the views
include: "/views/**/*.view"

datagroup: balcazartest_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: balcazartest_default_datagroup

explore: access_token {
  join: user {
    type: left_outer
    sql_on: ${access_token.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${access_token.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: session {
    type: left_outer
    sql_on: ${access_token.session_id} = ${session.id} ;;
    relationship: many_to_one
  }

  join: credentials_api3 {
    type: left_outer
    sql_on: ${access_token.credentials_api3_id} = ${credentials_api3.id} ;;
    relationship: many_to_one
  }

  join: oauth_client_app {
    type: left_outer
    sql_on: ${access_token.oauth_client_app_id} = ${oauth_client_app.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${oauth_client_app.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }
}

explore: action_hub_secret_user_state {
  join: user {
    type: left_outer
    sql_on: ${action_hub_secret_user_state.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: action_hub_state_authentication {
  join: user {
    type: left_outer
    sql_on: ${action_hub_state_authentication.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: active_data_maintenance_task {
  join: node {
    type: left_outer
    sql_on: ${active_data_maintenance_task.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }
}

explore: active_derived_table {}

explore: active_pdt_materialize_task {
  join: node {
    type: left_outer
    sql_on: ${active_pdt_materialize_task.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${active_pdt_materialize_task.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: active_pdt_publish_task {
  join: node {
    type: left_outer
    sql_on: ${active_pdt_publish_task.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }
}

explore: active_pdt_scraper_task {
  join: node {
    type: left_outer
    sql_on: ${active_pdt_scraper_task.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }
}

explore: alert {
  join: alert_condition {
    type: left_outer
    sql_on: ${alert.alert_condition_id} = ${alert_condition.id} ;;
    relationship: many_to_one
  }

  join: dashboard_element {
    type: left_outer
    sql_on: ${alert.dashboard_element_id} = ${dashboard_element.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_element.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${dashboard_element.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${dashboard_element.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${dashboard_element.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }
}

explore: alert_condition {}

explore: alert_condition_result {
  join: alert {
    type: left_outer
    sql_on: ${alert_condition_result.alert_id} = ${alert.id} ;;
    relationship: many_to_one
  }

  join: alert_condition {
    type: left_outer
    sql_on: ${alert_condition_result.alert_condition_id} = ${alert_condition.id} ;;
    relationship: many_to_one
  }

  join: dashboard_element {
    type: left_outer
    sql_on: ${alert.dashboard_element_id} = ${dashboard_element.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_element.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${dashboard_element.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${dashboard_element.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${dashboard_element.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }
}

explore: alert_destination {
  join: alert {
    type: left_outer
    sql_on: ${alert_destination.alert_id} = ${alert.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${alert_destination.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: delivery_channel {
    type: left_outer
    sql_on: ${alert_destination.delivery_channel_id} = ${delivery_channel.id} ;;
    relationship: many_to_one
  }

  join: alert_condition {
    type: left_outer
    sql_on: ${alert.alert_condition_id} = ${alert_condition.id} ;;
    relationship: many_to_one
  }

  join: dashboard_element {
    type: left_outer
    sql_on: ${alert.dashboard_element_id} = ${dashboard_element.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_element.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${dashboard_element.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${dashboard_element.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${dashboard_element.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: alert_notification {
  join: alert_condition_result {
    type: left_outer
    sql_on: ${alert_notification.alert_condition_result_id} = ${alert_condition_result.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${alert_notification.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: alert {
    type: left_outer
    sql_on: ${alert_condition_result.alert_id} = ${alert.id} ;;
    relationship: many_to_one
  }

  join: alert_condition {
    type: left_outer
    sql_on: ${alert_condition_result.alert_condition_id} = ${alert_condition.id} ;;
    relationship: many_to_one
  }

  join: dashboard_element {
    type: left_outer
    sql_on: ${alert.dashboard_element_id} = ${dashboard_element.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_element.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${dashboard_element.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${dashboard_element.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${dashboard_element.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: alert_sync_history {
  join: alert {
    type: left_outer
    sql_on: ${alert_sync_history.alert_id} = ${alert.id} ;;
    relationship: many_to_one
  }

  join: alert_condition {
    type: left_outer
    sql_on: ${alert.alert_condition_id} = ${alert_condition.id} ;;
    relationship: many_to_one
  }

  join: dashboard_element {
    type: left_outer
    sql_on: ${alert.dashboard_element_id} = ${dashboard_element.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_element.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${dashboard_element.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${dashboard_element.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${dashboard_element.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }
}

explore: alert_time_series_condition_state {
  join: alert_condition {
    type: left_outer
    sql_on: ${alert_time_series_condition_state.alert_condition_id} = ${alert_condition.id} ;;
    relationship: many_to_one
  }
}

explore: annotation {}

explore: annotation_category {}

explore: api_nonce {
  join: user {
    type: left_outer
    sql_on: ${api_nonce.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: api_usage {}

explore: artifact {}

explore: asklooker_index_config {}

explore: asklooker_index_execution_history {
  join: asklooker_index_config {
    type: left_outer
    sql_on: ${asklooker_index_execution_history.asklooker_index_config_id} = ${asklooker_index_config.id} ;;
    relationship: many_to_one
  }
}

explore: authenticated_download {
  join: user {
    type: left_outer
    sql_on: ${authenticated_download.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: backup_configuration {}

explore: cache_index {
  join: node {
    type: left_outer
    sql_on: ${cache_index.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }
}

explore: color_collection {}

explore: color_palette {
  join: color_collection {
    type: left_outer
    sql_on: ${color_palette.color_collection_id} = ${color_collection.id} ;;
    relationship: many_to_one
  }
}

explore: command {}

explore: compliance_user_permissions {}

explore: content_digest_item {
  join: user_content_digest {
    type: left_outer
    sql_on: ${content_digest_item.user_content_digest_id} = ${user_content_digest.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${user_content_digest.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: content_favorite {
  join: user {
    type: left_outer
    sql_on: ${content_favorite.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_favorite.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_favorite.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${content_favorite.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: content_metadata {
  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${content_metadata.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: content_metadata_group_user {
  join: content_metadata {
    type: left_outer
    sql_on: ${content_metadata_group_user.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${content_metadata_group_user.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${content_metadata_group_user.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${content_metadata.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: content_repo {}

explore: content_usage {}

explore: content_view {
  join: user {
    type: left_outer
    sql_on: ${content_view.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${content_view.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${content_view.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${content_metadata.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: cookie_consent {
  join: user {
    type: left_outer
    sql_on: ${cookie_consent.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_api {
  join: user {
    type: left_outer
    sql_on: ${credentials_api.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_api3 {
  join: user {
    type: left_outer
    sql_on: ${credentials_api3.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_email {
  join: user {
    type: left_outer
    sql_on: ${credentials_email.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_embed {
  join: user {
    type: left_outer
    sql_on: ${credentials_embed.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_ephemeral {
  join: user {
    type: left_outer
    sql_on: ${credentials_ephemeral.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_google {
  join: user {
    type: left_outer
    sql_on: ${credentials_google.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_ldap {
  join: user {
    type: left_outer
    sql_on: ${credentials_ldap.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_looker_openid {
  join: user {
    type: left_outer
    sql_on: ${credentials_looker_openid.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_oidc {
  join: user {
    type: left_outer
    sql_on: ${credentials_oidc.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_saml {
  join: user {
    type: left_outer
    sql_on: ${credentials_saml.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: credentials_totp {
  join: user {
    type: left_outer
    sql_on: ${credentials_totp.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: csp_report {}

explore: customer_artifact_store {}

explore: dashboard {
  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: dashboard_element {
  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_element.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${dashboard_element.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${dashboard_element.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${dashboard_element.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }
}

explore: dashboard_filter {
  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_filter.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: dashboard_json {
  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_json.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: dashboard_layout {
  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_layout.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: dashboard_layout_component {
  join: dashboard_layout {
    type: left_outer
    sql_on: ${dashboard_layout_component.dashboard_layout_id} = ${dashboard_layout.id} ;;
    relationship: many_to_one
  }

  join: dashboard_element {
    type: left_outer
    sql_on: ${dashboard_layout_component.dashboard_element_id} = ${dashboard_element.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_layout.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${dashboard.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${dashboard_element.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }
}

explore: datagroup {}

explore: data_migrations {}

explore: db_connection {
  join: user {
    type: left_outer
    sql_on: ${db_connection.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: db_connection_certificate {
    type: left_outer
    sql_on: ${db_connection.db_connection_certificate_id} = ${db_connection_certificate.id} ;;
    relationship: many_to_one
  }

  join: oauth_application {
    type: left_outer
    sql_on: ${db_connection.oauth_application_id} = ${oauth_application.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: db_connection_certificate {}

explore: db_connection_override {
  join: db_connection {
    type: left_outer
    sql_on: ${db_connection_override.db_connection_id} = ${db_connection.id} ;;
    relationship: many_to_one
  }

  join: db_connection_certificate {
    type: left_outer
    sql_on: ${db_connection_override.db_connection_certificate_id} = ${db_connection_certificate.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${db_connection.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: oauth_application {
    type: left_outer
    sql_on: ${db_connection.oauth_application_id} = ${oauth_application.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: db_credentials {
  join: user {
    type: left_outer
    sql_on: ${db_credentials.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: delivery_channel {}

explore: distributed_mutex {
  join: node {
    type: left_outer
    sql_on: ${distributed_mutex.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }
}

explore: email_verification {
  join: user {
    type: left_outer
    sql_on: ${email_verification.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: embed_config {}

explore: embed_nonce {}

explore: embed_secret {
  join: user {
    type: left_outer
    sql_on: ${embed_secret.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: encryption_key {}

explore: event {
  join: user {
    type: left_outer
    sql_on: ${event.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: event_attribute {
  join: event {
    type: left_outer
    sql_on: ${event_attribute.event_id} = ${event.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${event.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: field_usage {}

explore: flow {
  join: user {
    type: left_outer
    sql_on: ${flow.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: group {}

explore: group_group {}

explore: group_user {
  join: user {
    type: left_outer
    sql_on: ${group_user.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${group_user.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: history {
  join: user {
    type: left_outer
    sql_on: ${history.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${history.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${history.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: node {
    type: left_outer
    sql_on: ${history.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }

  join: path_prefix {
    type: left_outer
    sql_on: ${history.path_prefix_id} = ${path_prefix.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${history.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${history.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${history.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }
}

explore: homepage {
  join: user {
    type: left_outer
    sql_on: ${homepage.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${homepage.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${content_metadata.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: homepage_event {
  join: user {
    type: left_outer
    sql_on: ${homepage_event.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${homepage_event.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: homepage_section {
    type: left_outer
    sql_on: ${homepage_event.homepage_section_id} = ${homepage_section.id} ;;
    relationship: many_to_one
  }

  join: homepage_item {
    type: left_outer
    sql_on: ${homepage_event.homepage_item_id} = ${homepage_item.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${homepage.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${content_metadata.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: homepage_item {
  join: homepage_section {
    type: left_outer
    sql_on: ${homepage_item.homepage_section_id} = ${homepage_section.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${homepage_item.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${homepage_item.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${homepage_item.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${homepage_section.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${homepage.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }
}

explore: homepage_section {
  join: homepage {
    type: left_outer
    sql_on: ${homepage_section.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${homepage.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${homepage.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${content_metadata.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: integration_hub {}

explore: internal_help_resources_content {}

explore: ip_whitelist_rule {}

explore: ldap_config {}

explore: ldap_config_default_new_user_group {
  join: ldap_config {
    type: left_outer
    sql_on: ${ldap_config_default_new_user_group.ldap_config_id} = ${ldap_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${ldap_config_default_new_user_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }
}

explore: ldap_config_default_new_user_role {
  join: ldap_config {
    type: left_outer
    sql_on: ${ldap_config_default_new_user_role.ldap_config_id} = ${ldap_config.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${ldap_config_default_new_user_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: ldap_group {
  join: ldap_config {
    type: left_outer
    sql_on: ${ldap_group.ldap_config_id} = ${ldap_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${ldap_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: proposed_group {
    type: left_outer
    sql_on: ${ldap_group.proposed_group_id} = ${proposed_group.id} ;;
    relationship: many_to_one
  }
}

explore: ldap_group_role {
  join: ldap_group {
    type: left_outer
    sql_on: ${ldap_group_role.ldap_group_id} = ${ldap_group.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${ldap_group_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: ldap_config {
    type: left_outer
    sql_on: ${ldap_group.ldap_config_id} = ${ldap_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${ldap_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: proposed_group {
    type: left_outer
    sql_on: ${ldap_group.proposed_group_id} = ${proposed_group.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: ldap_user_attribute {
  join: ldap_config {
    type: left_outer
    sql_on: ${ldap_user_attribute.ldap_config_id} = ${ldap_config.id} ;;
    relationship: many_to_one
  }
}

explore: ldap_user_attribute_attribute {
  join: ldap_user_attribute {
    type: left_outer
    sql_on: ${ldap_user_attribute_attribute.ldap_user_attribute_id} = ${ldap_user_attribute.id} ;;
    relationship: many_to_one
  }

  join: user_attribute {
    type: left_outer
    sql_on: ${ldap_user_attribute_attribute.user_attribute_id} = ${user_attribute.id} ;;
    relationship: many_to_one
  }

  join: ldap_config {
    type: left_outer
    sql_on: ${ldap_user_attribute.ldap_config_id} = ${ldap_config.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${user_attribute.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: license_validation_response {}

explore: login {
  join: user {
    type: left_outer
    sql_on: ${login.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: login_attempt {
  join: user {
    type: left_outer
    sql_on: ${login_attempt.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: look {
  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: looker_q_looker_bq_activemq_acks {}

explore: looker_q_looker_bq_activemq_lock {}

explore: looker_q_looker_bq_activemq_msgs {}

explore: lookml_dashboard_metadata {
  join: content_metadata {
    type: left_outer
    sql_on: ${lookml_dashboard_metadata.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${lookml_dashboard_metadata.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: lookml_dashboard_metadata_v2 {
  join: space {
    type: left_outer
    sql_on: ${lookml_dashboard_metadata_v2.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${lookml_dashboard_metadata_v2.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: lookml_model {}

explore: lookml_model_db_connection {
  join: lookml_model {
    type: left_outer
    sql_on: ${lookml_model_db_connection.lookml_model_id} = ${lookml_model.id} ;;
    relationship: many_to_one
  }

  join: db_connection {
    type: left_outer
    sql_on: ${lookml_model_db_connection.db_connection_id} = ${db_connection.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${db_connection.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: db_connection_certificate {
    type: left_outer
    sql_on: ${db_connection.db_connection_certificate_id} = ${db_connection_certificate.id} ;;
    relationship: many_to_one
  }

  join: oauth_application {
    type: left_outer
    sql_on: ${db_connection.oauth_application_id} = ${oauth_application.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: look_json {
  join: look {
    type: left_outer
    sql_on: ${look_json.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: maestro_state_store_child {}

explore: maestro_state_store_state {}

explore: mail_job {}

explore: marketplace_auto_installable_listings {}

explore: marketplace_installation {}

explore: marketplace_install_task {
  join: user {
    type: left_outer
    sql_on: ${marketplace_install_task.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: merge_query {}

explore: merge_query_source_query {
  join: merge_query {
    type: left_outer
    sql_on: ${merge_query_source_query.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${merge_query_source_query.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: mobile_token {
  join: user {
    type: left_outer
    sql_on: ${mobile_token.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: model_set {}

explore: new_active_derived_table {}

explore: node {}

explore: notification {}

explore: oauth_application {}

explore: oauth_client_app {
  join: group {
    type: left_outer
    sql_on: ${oauth_client_app.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }
}

explore: oauth_client_app_user_activation {
  join: oauth_client_app {
    type: left_outer
    sql_on: ${oauth_client_app_user_activation.oauth_client_app_id} = ${oauth_client_app.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${oauth_client_app_user_activation.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${oauth_client_app.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: oauth_request_state {
  join: oauth_user_state {
    type: left_outer
    sql_on: ${oauth_request_state.oauth_user_state_id} = ${oauth_user_state.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${oauth_user_state.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: oauth_application {
    type: left_outer
    sql_on: ${oauth_user_state.oauth_application_id} = ${oauth_application.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: oauth_user_state {
  join: user {
    type: left_outer
    sql_on: ${oauth_user_state.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: oauth_application {
    type: left_outer
    sql_on: ${oauth_user_state.oauth_application_id} = ${oauth_application.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: oidc_config {}

explore: oidc_config_default_new_user_group {
  join: oidc_config {
    type: left_outer
    sql_on: ${oidc_config_default_new_user_group.oidc_config_id} = ${oidc_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${oidc_config_default_new_user_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }
}

explore: oidc_config_default_new_user_role {
  join: oidc_config {
    type: left_outer
    sql_on: ${oidc_config_default_new_user_role.oidc_config_id} = ${oidc_config.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${oidc_config_default_new_user_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: oidc_group {
  join: oidc_config {
    type: left_outer
    sql_on: ${oidc_group.oidc_config_id} = ${oidc_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${oidc_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: proposed_group {
    type: left_outer
    sql_on: ${oidc_group.proposed_group_id} = ${proposed_group.id} ;;
    relationship: many_to_one
  }
}

explore: oidc_group_role {
  join: oidc_group {
    type: left_outer
    sql_on: ${oidc_group_role.oidc_group_id} = ${oidc_group.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${oidc_group_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: oidc_config {
    type: left_outer
    sql_on: ${oidc_group.oidc_config_id} = ${oidc_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${oidc_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: proposed_group {
    type: left_outer
    sql_on: ${oidc_group.proposed_group_id} = ${proposed_group.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: oidc_nonce {}

explore: oidc_user_attribute {
  join: oidc_config {
    type: left_outer
    sql_on: ${oidc_user_attribute.oidc_config_id} = ${oidc_config.id} ;;
    relationship: many_to_one
  }
}

explore: oidc_user_attribute_attribute {
  join: oidc_user_attribute {
    type: left_outer
    sql_on: ${oidc_user_attribute_attribute.oidc_user_attribute_id} = ${oidc_user_attribute.id} ;;
    relationship: many_to_one
  }

  join: user_attribute {
    type: left_outer
    sql_on: ${oidc_user_attribute_attribute.user_attribute_id} = ${user_attribute.id} ;;
    relationship: many_to_one
  }

  join: oidc_config {
    type: left_outer
    sql_on: ${oidc_user_attribute.oidc_config_id} = ${oidc_config.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${user_attribute.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: one_time_key {}

explore: path_prefix {}

explore: pdt_build_catalog {}

explore: pdt_event_log {}

explore: permission_set {}

explore: prefetch {}

explore: prod_pdt_metadata {}

explore: project_configuration {}

explore: project_deployment {
  join: user {
    type: left_outer
    sql_on: ${project_deployment.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: project_log {
  join: user {
    type: left_outer
    sql_on: ${project_log.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: project_state {}

explore: project_state_test_result {
  join: project_state {
    type: left_outer
    sql_on: ${project_state_test_result.project_state_id} = ${project_state.id} ;;
    relationship: many_to_one
  }
}

explore: proposed_group {}

explore: proposed_group_role {
  join: proposed_group {
    type: left_outer
    sql_on: ${proposed_group_role.proposed_group_id} = ${proposed_group.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${proposed_group_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: prototype_resolution {}

explore: proxy_nonce {
  join: user {
    type: left_outer
    sql_on: ${proxy_nonce.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: proxy_verification_token {}

explore: query {}

explore: query_analysis_config {
  join: query {
    type: left_outer
    sql_on: ${query_analysis_config.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: query_api_client_context {}

explore: query_metrics {
  join: history {
    type: left_outer
    sql_on: ${query_metrics.history_id} = ${history.id} ;;
    relationship: many_to_one
  }

  join: query_task {
    type: left_outer
    sql_on: ${query_metrics.query_task_id} = ${query_task.id} ;;
    relationship: many_to_one
  }

  join: artifact {
    type: left_outer
    sql_on: ${query_metrics.artifact_id} = ${artifact.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${history.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${history.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${history.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: node {
    type: left_outer
    sql_on: ${history.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }

  join: path_prefix {
    type: left_outer
    sql_on: ${history.path_prefix_id} = ${path_prefix.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${history.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${history.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${history.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }
}

explore: query_task {
  join: user {
    type: left_outer
    sql_on: ${query_task.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${query_task.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${query_task.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: node {
    type: left_outer
    sql_on: ${query_task.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }

  join: path_prefix {
    type: left_outer
    sql_on: ${query_task.path_prefix_id} = ${path_prefix.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${query_task.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${query_task.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${query_task.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }
}

explore: render_job {
  join: user {
    type: left_outer
    sql_on: ${render_job.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: node {
    type: left_outer
    sql_on: ${render_job.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: repository_credential {}

explore: result_maker {
  join: query {
    type: left_outer
    sql_on: ${result_maker.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${sql_query.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: role {
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: role_group {
  join: group {
    type: left_outer
    sql_on: ${role_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${role_group.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: role_user {
  join: role {
    type: left_outer
    sql_on: ${role_user.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${role_user.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: saml_config {}

explore: saml_config_default_new_user_group {
  join: saml_config {
    type: left_outer
    sql_on: ${saml_config_default_new_user_group.saml_config_id} = ${saml_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${saml_config_default_new_user_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }
}

explore: saml_config_default_new_user_role {
  join: saml_config {
    type: left_outer
    sql_on: ${saml_config_default_new_user_role.saml_config_id} = ${saml_config.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${saml_config_default_new_user_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: saml_group {
  join: saml_config {
    type: left_outer
    sql_on: ${saml_group.saml_config_id} = ${saml_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${saml_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: proposed_group {
    type: left_outer
    sql_on: ${saml_group.proposed_group_id} = ${proposed_group.id} ;;
    relationship: many_to_one
  }
}

explore: saml_group_role {
  join: saml_group {
    type: left_outer
    sql_on: ${saml_group_role.saml_group_id} = ${saml_group.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${saml_group_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: saml_config {
    type: left_outer
    sql_on: ${saml_group.saml_config_id} = ${saml_config.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${saml_group.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: proposed_group {
    type: left_outer
    sql_on: ${saml_group.proposed_group_id} = ${proposed_group.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: saml_nonce {}

explore: saml_user_attribute {
  join: saml_config {
    type: left_outer
    sql_on: ${saml_user_attribute.saml_config_id} = ${saml_config.id} ;;
    relationship: many_to_one
  }
}

explore: saml_user_attribute_attribute {
  join: saml_user_attribute {
    type: left_outer
    sql_on: ${saml_user_attribute_attribute.saml_user_attribute_id} = ${saml_user_attribute.id} ;;
    relationship: many_to_one
  }

  join: user_attribute {
    type: left_outer
    sql_on: ${saml_user_attribute_attribute.user_attribute_id} = ${user_attribute.id} ;;
    relationship: many_to_one
  }

  join: saml_config {
    type: left_outer
    sql_on: ${saml_user_attribute.saml_config_id} = ${saml_config.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${user_attribute.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: scheduled_job {
  join: scheduled_plan {
    type: left_outer
    sql_on: ${scheduled_job.scheduled_plan_id} = ${scheduled_plan.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${scheduled_job.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${scheduled_job.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${scheduled_job.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${scheduled_job.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: scheduled_render_properties {
    type: left_outer
    sql_on: ${scheduled_job.scheduled_render_properties_id} = ${scheduled_render_properties.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: scheduled_job_destination {
  join: scheduled_job {
    type: left_outer
    sql_on: ${scheduled_job_destination.scheduled_job_id} = ${scheduled_job.id} ;;
    relationship: many_to_one
  }

  join: scheduled_plan_destination {
    type: left_outer
    sql_on: ${scheduled_job_destination.scheduled_plan_destination_id} = ${scheduled_plan_destination.id} ;;
    relationship: many_to_one
  }

  join: scheduled_plan {
    type: left_outer
    sql_on: ${scheduled_job.scheduled_plan_id} = ${scheduled_plan.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${scheduled_job.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${scheduled_job.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${scheduled_job.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${scheduled_job.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: scheduled_render_properties {
    type: left_outer
    sql_on: ${scheduled_job.scheduled_render_properties_id} = ${scheduled_render_properties.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: scheduled_job_stage {
  join: scheduled_job {
    type: left_outer
    sql_on: ${scheduled_job_stage.scheduled_job_id} = ${scheduled_job.id} ;;
    relationship: many_to_one
  }

  join: node {
    type: left_outer
    sql_on: ${scheduled_job_stage.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }

  join: scheduled_plan {
    type: left_outer
    sql_on: ${scheduled_job.scheduled_plan_id} = ${scheduled_plan.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${scheduled_job.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${scheduled_job.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${scheduled_job.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${scheduled_job.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: scheduled_render_properties {
    type: left_outer
    sql_on: ${scheduled_job.scheduled_render_properties_id} = ${scheduled_render_properties.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: scheduled_plan {
  join: user {
    type: left_outer
    sql_on: ${scheduled_plan.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${scheduled_plan.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${scheduled_plan.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${scheduled_plan.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: scheduled_plan_destination {
  join: scheduled_plan {
    type: left_outer
    sql_on: ${scheduled_plan_destination.scheduled_plan_id} = ${scheduled_plan.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${scheduled_plan.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${scheduled_plan.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${scheduled_plan.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${scheduled_plan.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: scheduled_render_properties {
  join: scheduled_plan {
    type: left_outer
    sql_on: ${scheduled_render_properties.scheduled_plan_id} = ${scheduled_plan.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${scheduled_plan.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${scheduled_plan.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${scheduled_plan.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${scheduled_plan.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: schema_migrations {}

explore: secrets {}

explore: session {
  join: user {
    type: left_outer
    sql_on: ${session.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: access_token {
    type: left_outer
    sql_on: ${session.access_token_id} = ${access_token.outgoing_access_token_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${access_token.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: credentials_api3 {
    type: left_outer
    sql_on: ${access_token.credentials_api3_id} = ${credentials_api3.id} ;;
    relationship: many_to_one
  }

  join: oauth_client_app {
    type: left_outer
    sql_on: ${access_token.oauth_client_app_id} = ${oauth_client_app.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${oauth_client_app.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }
}

explore: setting {}

explore: slack_identity {
  join: user {
    type: left_outer
    sql_on: ${slack_identity.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: slug {
  join: query {
    type: left_outer
    sql_on: ${slug.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: result_maker {
    type: left_outer
    sql_on: ${slug.result_maker_id} = ${result_maker.id} ;;
    relationship: many_to_one
  }

  join: merge_query {
    type: left_outer
    sql_on: ${result_maker.merge_query_id} = ${merge_query.id} ;;
    relationship: many_to_one
  }

  join: sql_query {
    type: left_outer
    sql_on: ${result_maker.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${sql_query.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: smtp_settings {}

explore: space {
  join: content_metadata {
    type: left_outer
    sql_on: ${space.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: space_user {
  join: user {
    type: left_outer
    sql_on: ${space_user.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${space_user.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${space.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: look {
    type: left_outer
    sql_on: ${content_metadata.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${content_metadata.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
}

explore: sql_query {
  join: user {
    type: left_outer
    sql_on: ${sql_query.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: sql_text {}

explore: support_access_allowlist {}

explore: support_access_audit_log {}

explore: system_status {
  join: node {
    type: left_outer
    sql_on: ${system_status.node_id} = ${node.prev_node_id} ;;
    relationship: many_to_one
  }
}

explore: theme {}

explore: thumbnail_image {
  join: look {
    type: left_outer
    sql_on: ${thumbnail_image.look_id} = ${look.id} ;;
    relationship: many_to_one
  }

  join: dashboard {
    type: left_outer
    sql_on: ${thumbnail_image.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }

  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }

  join: content_metadata {
    type: left_outer
    sql_on: ${look.content_metadata_id} = ${content_metadata.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: homepage {
    type: left_outer
    sql_on: ${content_metadata.homepage_id} = ${homepage.id} ;;
    relationship: many_to_one
  }
}

explore: upload_table {
  join: db_connection {
    type: left_outer
    sql_on: ${upload_table.db_connection_id} = ${db_connection.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${upload_table.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: db_connection_certificate {
    type: left_outer
    sql_on: ${db_connection.db_connection_certificate_id} = ${db_connection_certificate.id} ;;
    relationship: many_to_one
  }

  join: oauth_application {
    type: left_outer
    sql_on: ${db_connection.oauth_application_id} = ${oauth_application.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user {
  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_access_filter {
  join: user {
    type: left_outer
    sql_on: ${user_access_filter.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_attribute {
  join: user {
    type: left_outer
    sql_on: ${user_attribute.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_attribute_group_value {
  join: group {
    type: left_outer
    sql_on: ${user_attribute_group_value.group_id} = ${group.external_group_id} ;;
    relationship: many_to_one
  }

  join: user_attribute {
    type: left_outer
    sql_on: ${user_attribute_group_value.user_attribute_id} = ${user_attribute.id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${user_attribute.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_attribute_user_value {
  join: user {
    type: left_outer
    sql_on: ${user_attribute_user_value.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: user_attribute {
    type: left_outer
    sql_on: ${user_attribute_user_value.user_attribute_id} = ${user_attribute.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_attribute_v2 {}

explore: user_content_digest {
  join: user {
    type: left_outer
    sql_on: ${user_content_digest.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_direct_role {
  join: user {
    type: left_outer
    sql_on: ${user_direct_role.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${user_direct_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_facts {
  join: user {
    type: left_outer
    sql_on: ${user_facts.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }
}

explore: user_facts_role {
  join: user {
    type: left_outer
    sql_on: ${user_facts_role.user_id} = ${user.dev_mode_user_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: version_set {
    type: left_outer
    sql_on: ${user.version_set_id} = ${version_set.id} ;;
    relationship: many_to_one
  }

  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }

  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: version_set {}

explore: visualization_manifest {}

explore: vis_config {}

explore: vis_config_defaults {}

explore: vis_config_queries {}

explore: whitelabel_configuration {}
