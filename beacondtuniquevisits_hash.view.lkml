view: beacondtuniquevisits_hash {
  sql_table_name: looker_pub1.beacondtuniquevisits_hash ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: daynum {
    type: number
    sql: ${TABLE}.daynum ;;
  }

  dimension: devicetype {
    type: number
    sql: ${TABLE}.devicetype ;;
  }

  dimension: matchedhashcount {
    type: number
    sql: ${TABLE}.matchedhashcount ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
