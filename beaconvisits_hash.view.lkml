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
  }

  dimension: unmatchedhashcount {
    type: number
    sql: ${TABLE}.unmatchedhashcount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
