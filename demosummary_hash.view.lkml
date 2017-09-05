view: demosummary_hash {
  sql_table_name: looker_pub1.demosummary_hash ;;

  dimension: attribute {
    type: string
    sql: ${TABLE}.attribute ;;
    html: <font size="2" color="#1f3e5a">{{ rendered_value }}</font> ;;
  }

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: daynum {
    type: number
    sql: ${TABLE}.daynum ;;
  }

  dimension: result {
    type: number
    sql: ${TABLE}.result ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
    suggest_persist_for: "60 minutes"
  }

  dimension: pageid {
    type: string
    sql: ${TABLE}.pageid ;;
    suggest_persist_for: "60 minutes"
  }

  dimension: usresult {
    type: number
    sql: ${TABLE}.usresult ;;
  }

  measure: usd_format {
    type: average
    hidden: yes
    value_format: "$#,##0"
    sql: ${TABLE}.result ;;
  }

  measure: perc_format {
    type: average
    hidden: yes
    value_format: "0.00\%"
    sql: ${TABLE}.result ;;
  }

  measure: age_format {
    type: average
    hidden: yes
    value_format: "0 \" years old\""
    sql: ${TABLE}.result ;;
  }

  measure: hhs_format {
    type: average
    hidden: yes
    value_format: "0.0 \" people\""
    sql: ${TABLE}.result ;;
  }

  measure: count_Result {
    type: average
    value_format: "0.00\%"
    sql:  ${TABLE}.result ;;
    html: {% if attribute._value contains "Age" %}
          <font size="2" color="#228b22">{{ age_format._rendered_value }}</font>
          {% elsif attribute._value contains "Size" %}
          <font size="2" color="#228b22">{{ hhs_format._rendered_value }}</font>
          {% elsif attribute._value contains "Income" or attribute._value contains "Value" %}
          <font size="2" color="#228b22">{{ usd_format._rendered_value }}</font>
          {% else %}
          <font size="2" color="#228b22">{{ rendered_value }}</font>
          {% endif %}

          ;;
    required_fields: [age_format,hhs_format,usd_format]
  }

  measure: count_UsResult {
    type: average
    sql:  ${TABLE}.usresult ;;
    html: <font size="2" color="#228b22">{{ rendered_value }}</font> ;;
  }

#   measure: percent_Result {
#     type: number
#     hidden: yes
#     value_format: "0.00\%"
#     sql: 100*(${count_Result} - ${count_UsResult})/ NULLIF(${count_UsResult},0) ;;
#     html: <font size="2" color="#228b22">{{ rendered_value }}</font> ;;
#   }
}
