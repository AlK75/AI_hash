view: alc_multisitehashes {
  sql_table_name: looker_pub1.alc_multisitehashes ;;

  dimension: hashedemail {
    type: string
    sql: ${TABLE}.hashedemail ;;
  }

  dimension: ismatched {
    type: yesno
    sql: ${TABLE}.ismatched ;;
  }

  measure: count_MultiHash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
  }

  measure: count_MatchedMultiHash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: ismatched
      value: "Yes"
    }
  }
}
