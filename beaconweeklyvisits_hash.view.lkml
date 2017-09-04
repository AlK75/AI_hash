view: beaconweeklyvisits_hash {
  sql_table_name: looker_pub1.beaconweeklyvisits_hash ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: matchedhashcount {
    type: number
    sql: ${TABLE}.matchedhashcount ;;
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

  dimension: unmatchedhashcount {
    type: number
    sql: ${TABLE}.unmatchedhashcount ;;
  }

  dimension: weeknum {
    type: date_week
    sql: ${TABLE}.weeknum ;;
  }

  measure: count_MatchedEmails {
    type: sum
    sql:  ${TABLE}.matchedhashcount ;;
  }

  measure: count_UnmatchedEmails {
    type: sum
    sql:  ${TABLE}.unmatchedhashcount ;;
  }

  measure: count_UniqueEmails {
    type: number
    sql: ${count_MatchedEmails} + ${count_UnmatchedEmails} ;;
  }
}
