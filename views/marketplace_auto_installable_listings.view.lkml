view: marketplace_auto_installable_listings {
  sql_table_name: gcpl2218.marketplace_auto_installable_listings ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: can_update {
    type: yesno
    sql: ${TABLE}.can_update ;;
  }

  dimension: listing_id {
    type: string
    sql: ${TABLE}.listing_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
