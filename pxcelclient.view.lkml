view: pxcelclient {
  sql_table_name: looker_pub1.pxcelclient ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: sitename {
    type: string
    sql: ${TABLE}.sitename ;;
  }

  measure: count {
    type: count
    drill_fields: [clientname, sitename]
  }
}
