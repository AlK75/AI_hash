view: alc_email {
  sql_table_name: looker_pub1.alc_email ;;

  dimension: emailid {
    type: number
    value_format_name: id
    sql: ${TABLE}.emailid ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: zip9 {
    type: number
    sql: ${TABLE}.zip9 ;;
  }

  dimension: zip9emailed {
    type: number
    sql: ${TABLE}.zip9emailed ;;
  }

  dimension: zip9matched {
    type: yesno
    sql: ${TABLE}.zip9matched ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.zip9, ${TABLE}.emailid) ;;
  }

}
