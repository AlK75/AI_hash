view: awbeacon {
  sql_table_name: looker_pub1.awbeacon ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: removed {
    type: yesno
    sql: ${TABLE}.removed ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: userattribute {
    type: string
    sql: ${TABLE}.userattribute ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
