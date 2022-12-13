view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: dynamic_date {
    sql:
      {% case date_part._parameter_value %}
        {% when 'day' %}
          ${created_date}
        {% when 'month' %}
          ${created_month}
        {% when 'week' %}
          ${created_week}
        {% when 'year' %}
          ${created_year}
        {% else %}
        ${created_date}
      {% endcase %} ;;
  }

  parameter: date_part {
    type: unquoted
    allowed_value: {
      label: "Break by Days"
      value: "day"
    }

    allowed_value: {
      label: "Break by Weeks"
      value: "week"
    }

    allowed_value: {
      label: "Break by Months"
      value: "month"
    }

    allowed_value: {
      label: "Break by Year"
      value: "year"
    }
  }

  parameter: dimension_1 {
    type: unquoted
    allowed_value: {
      label: "Status"
      value: "status"
    }

    allowed_value: {
      label: "User ID"
      value: "user_id"
    }

    allowed_value: {
      label: "Name"
      value: "name"
    }

    allowed_value: {
      label: "Age"
      value: "age"
    }

    allowed_value: {
      label: "ZIP Code"
      value: "zip_code"
    }
  }


  parameter: dimension_2 {
    type: unquoted
    allowed_value: {
      label: "Status"
      value: "status"
    }

    allowed_value: {
      label: "User ID"
      value: "user_id"
    }

    allowed_value: {
      label: "Name"
      value: "name"
    }

    allowed_value: {
      label: "Age"
      value: "age"
    }

    allowed_value: {
      label: "ZIP Code"
      value: "zip_code"
    }
  }


  parameter: dimension_3 {
    type: unquoted
    allowed_value: {
      label: "Status"
      value: "status"
    }

    allowed_value: {
      label: "User ID"
      value: "user_id"
    }

    allowed_value: {
      label: "Name"
      value: "name"
    }

    allowed_value: {
      label: "Age"
      value: "age"
    }

    allowed_value: {
      label: "ZIP Code"
      value: "zip_code"
    }
  }


  # parameter: dimension_4 {
  #   type: string
  #   allowed_value: {
  #     label: "Status"
  #     value: "status"
  #   }

  #   allowed_value: {
  #     label: "User ID"
  #     value: "user_id"
  #   }

  #   allowed_value: {
  #     label: "Name"
  #     value: "name"
  #   }

  #   allowed_value: {
  #     label: "Age"
  #     value: "age"
  #   }

  #   allowed_value: {
  #     label: "ZIP Code"
  #     value: "zip_code"
  #   }
  # }

  dimension: dynamic_dim_1 {
    type: string
    label_from_parameter: dimension_1
    sql:
    {% if dimension_1._parameter_value == 'status' %}
      ${status}
    {% elsif dimension_1._parameter_value == 'user_id' %}
      ${user_id}
    {% elsif dimension_1._parameter_value == 'name' %}
      ${users.name}
    {% elsif dimension_1._parameter_value == 'age' %}
      ${users.age}
    {% elsif dimension_1._parameter_value == 'zip_code' %}
      ${users.zip}
    {% else %}
      NULL
    {% endif %}
    ;;
  }

  dimension: dynamic_dim_2 {
    type: string
    label_from_parameter: dimension_2
    sql:
    {% if dimension_2._parameter_value == 'status' %}
      ${status}
    {% elsif dimension_2._parameter_value == 'user_id' %}
      ${user_id}
    {% elsif dimension_2._parameter_value == 'name' %}
      ${users.name}
    {% elsif dimension_2._parameter_value == 'age' %}
      ${users.age}
    {% elsif dimension_2._parameter_value == 'zip_code' %}
      ${users.zip}
    {% else %}
      NULL
    {% endif %}
    ;;
  }

  dimension: dynamic_dim_3 {
    type: string
    label_from_parameter: dimension_3
    sql:
    {% if dimension_3._parameter_value == 'status' %}
      ${status}
    {% elsif dimension_3._parameter_value == 'user_id' %}
      ${user_id}
    {% elsif dimension_3._parameter_value == 'name' %}
      ${users.name}
    {% elsif dimension_3._parameter_value == 'age' %}
      ${users.age}
    {% elsif dimension_3._parameter_value == 'zip_code' %}
      ${users.zip}
    {% else %}
      NULL
    {% endif %}
    ;;
  }

  # dimension: dynamic_dim_4 {
  #   type: string
  #   label_from_parameter: dimension_4
  #   sql:
  #   {% if dimension_4._parameter_value == 'status' %}
  #     ${status}
  #   {% elsif dimension_4._parameter_value == 'user_id' %}
  #     ${user_id}
  #   {% elsif dimension_4._parameter_value == 'name' %}
  #     ${users.name}
  #   {% elsif dimension_4._parameter_value == 'zip_code' %}
  #     ${users.zip}
  #   {% else %}
  #     NULL
  #   {% endif %}
  #   ;;
  # }

  dimension: start_date {
    group_label: "Start"
    label: "Start Date"
    type: date
    convert_tz: no
    sql: ${created_date} ;;
    html:{{ value | date: "%h %e, %Y" }};;
  }

  dimension: start_time {
    group_label: "Start"
    label: "Start Time"
    type: date_time
    convert_tz: no
    sql: ${TABLE}.created_at ;;
    html:{{ value | date: "%h %e, %Y %I:%M %P" }};;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
    link: {
      label: "Custom Drill Dashboard"
      url: "https://gcpl2218.cloud.looker.com/dashboards/350?Dimension+2=status&Created+Month={{created_month}}&Dimension+1=user%5E_id&Dimension+3=name"
    }
  }

  # measure: count2 {
  #   type: count
  #   drill_fields: [detail*]
  #   html: {{ rendered_value }}
  #         <ul>
  #         <li>Value: {{ rendered_value }} </li>
  #         </ul> ;;
  # }

# ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      order_items_vijaya.count,
      ten_million_orders.count
    ]
  }
}
