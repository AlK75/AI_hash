view: alc_email_hb {
  sql_table_name: looker_pub1.alc_email_hb ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: bouncetype {
    type: string
    sql: ${TABLE}.bouncetype ;;
  }

  dimension: emailcount {
    type: number
    sql: ${TABLE}.emailcount ;;
  }

  dimension: ismatched {
    type: yesno
    sql: ${TABLE}.ismatched ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  measure: count_MatchedHBSuppressed {
    type: sum
    sql: ${TABLE}.emailcount ;;
    filters: {
      field: ismatched
      value: "Yes"
    }
  }

  measure: count_UnmatchedHBSuppressed {
    type: sum
    sql: ${TABLE}.emailcount ;;
    filters: {
      field: ismatched
      value: "No"
    }
  }

}
