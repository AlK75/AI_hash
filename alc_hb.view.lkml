view: alc_hb {
  sql_table_name: looker_pub1.alc_hb ;;

  dimension: hbcount {
    type: number
    sql: ${TABLE}.hbcount ;;
  }

  dimension: occount {
    type: number
    sql: ${TABLE}.hbcount ;;
  }

  dimension: restcount {
    type: number
    sql: ${TABLE}.hbcount ;;
  }

  dimension: weeknum {
    type: date_week
    primary_key: yes
    sql: ${TABLE}.weeknum ;;
  }

  measure: count_hb {
    type: sum
    sql:  ${TABLE}.hbcount ;;
  }

  measure: count_oc {
    type: sum
    sql:  ${TABLE}.occount ;;
  }

  measure: count_rest {
    type: sum
    sql:  ${TABLE}.restcount ;;
  }

  measure: count_nothb {
    type: number
    sql:  ${count_oc} + ${count_rest} ;;
  }

  measure: percent_HB {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_hb} / NULLIF(${count_nothb},0);;
  }
}
