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
  }

  dimension: unmatchedhashcount {
    type: number
    sql: ${TABLE}.unmatchedhashcount ;;
  }

  dimension_group: weeknum {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.weeknum ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
