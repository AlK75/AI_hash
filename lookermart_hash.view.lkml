view: lookermart_hash {
  sql_table_name: looker_pub1.lookermart_hash ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: daynum {
    type: number
    sql: ${TABLE}.daynum ;;
  }

  dimension: daypart {
    type: number
    sql: ${TABLE}.daypart ;;
  }

  dimension: devicecount {
    type: number
    sql: ${TABLE}.devicecount ;;
  }

  dimension: devicetype {
    type: number
    sql: ${TABLE}.devicetype ;;
  }

  dimension: hashedemail {
    type: string
    sql: ${TABLE}.hashedemail ;;
  }

  dimension: individualid {
    type: number
    value_format_name: id
    sql: ${TABLE}.individualid ;;
  }

  dimension: ipnum {
    type: number
    sql: ${TABLE}.ipnum ;;
  }

  dimension: iscrawler {
    type: yesno
    sql: ${TABLE}.iscrawler ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: zip9 {
    type: number
    sql: ${TABLE}.zip9 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
