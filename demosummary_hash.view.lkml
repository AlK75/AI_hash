view: demosummary_hash {
  sql_table_name: looker_pub1.demosummary_hash ;;

  dimension: attribute {
    type: string
    sql: ${TABLE}.attribute ;;
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
  }

  dimension: usresult {
    type: number
    sql: ${TABLE}.usresult ;;
  }

  measure: usd_format {
    type: sum
    hidden: yes
    value_format: "$0"
    sql: ${TABLE}.result ;;
  }

  measure: perc_format {
    type: sum
    hidden: yes
    value_format: "0.00\%"
    sql: ${TABLE}.result ;;
  }

  measure: age_format {
    type: sum
    hidden: yes
    value_format: "0 \" years old\""
    sql: ${TABLE}.result ;;
  }

  measure: hhs_format {
    type: sum
    hidden: yes
    value_format: "0.0 \" people\""
    sql: ${TABLE}.result ;;
  }

  measure: count_Result {
    type: sum
    value_format: "0.00\%"
    sql:  ${TABLE}.result ;;
    html: {% if attribute._value contains "Age" %}
          {{ age_format._rendered_value }}
          {% elsif attribute._value contains "Size" %}
          {{ hhs_format._rendered_value }}
          {% elsif attribute._value contains "Income" or attribute._value contains "Value" %}
          {{ usd_format._rendered_value }}
          {% else %}
          {{ rendered_value }}
          {% endif %}
          ;;
    required_fields: [age_format,hhs_format,usd_format]
  }

  measure: count_UsResult {
    type: sum
    sql:  ${TABLE}.usresult ;;
  }

  measure: percent_Result {
    type: number
    value_format: "0.00\%"
    sql: 100*(${count_Result} - ${count_UsResult})/ NULLIF(${count_UsResult},0) ;;
  }
}
