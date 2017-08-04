view: beaconvisits_hash {
  sql_table_name: looker_pub1.beaconvisits_hash ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: daynum {
    type: number
    sql: ${TABLE}.daynum ;;
  }

  dimension: emailcount {
    type: number
    sql: ${TABLE}.emailcount ;;
  }

  dimension: matchedhashcount {
    type: number
    sql: ${TABLE}.matchedhashcount ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
    suggest_persist_for: "1 minute"
  }

  dimension: unmatchedhashcount {
    type: number
    sql: ${TABLE}.unmatchedhashcount ;;
  }

  measure: count_TotalEmails {
    type: sum
    sql:  ${TABLE}.emailcount ;;
    html: <font size="7">{{rendered_value}}</font> ;;
  }

  measure: count_MatchedEmails {
    type: sum
    sql:  ${TABLE}.matchedhashcount ;;
    html: <font size="7">{{rendered_value}}</font> ;;
  }

  measure: count_UnmatchedEmails {
    type: sum
    sql:  ${TABLE}.unmatchedhashcount ;;
  }

  measure: count_UniqueEmails {
    type: number
    sql: ${count_MatchedEmails} + ${count_UnmatchedEmails} ;;
    html: <font size="7">{{rendered_value}}</font> ;;
  }

  measure: percent_Matched {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_MatchedEmails} / NULLIF(${count_UniqueEmails},0) ;;
  }
}
