view: client2lookeruser {
  sql_table_name: looker_pub1.client2lookeruser ;;

  dimension: clientname {
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: userattribute {
    type: string
    sql: ${TABLE}.userattribute ;;
  }

  measure: count {
    type: count
    drill_fields: [clientname]
  }
}
