view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src=https://cdn3.iconfinder.com/data/icons/business-part-2-1/48/Tag-Brand-Cost-Label-Name-Price-512.png" height=12 width=12> </a> ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src=httpshttps://cdn-icons-png.flaticon.com/128/4196/4196707.png" height=12 width=12> </a> ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: retail_price_string {
    type:  string
    sql: concat("$",${retail_price}) ;;
  }

  dimension: non_numeric {
    type:  string
    sql: replace (${retail_price_string},"$","") ;;
  }

  dimension: to_number_dim {
    type:  number
    sql: CAST (${non_numeric} as INTEGER) ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
