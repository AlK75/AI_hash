view: beacondailyvisits_hash {
  sql_table_name: looker_pub1.beacondailyvisits_hash ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: daynum {
    type: date
    sql: ${TABLE}.daynum ;;
  }

  dimension: matchedemailcount {
    type: number
    sql: ${TABLE}.matchedemailcount ;;
  }

  dimension: pageid {
    type: string
    sql: ${TABLE}.pageid ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: totalemailcount {
    type: number
    sql: ${TABLE}.totalemailcount ;;
  }

  dimension: uniqueemailcount {
    type: number
    sql: ${TABLE}.uniqueemailcount ;;
  }

 measure: count_MatchedEmails {
  type: sum
  sql:  ${TABLE}.matchedemailcount ;;
}

measure: count_UniqueEmails {
  type: sum
  sql:  ${TABLE}.uniqueemailcount ;;
}

measure: count_TotalEmails {
  type: sum
  sql:  ${TABLE}.totalemailcount ;;
}
}
