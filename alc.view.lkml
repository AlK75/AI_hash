view: alc {
  sql_table_name: looker_pub1.alc ;;

  dimension: beaconid {
    type: string
    sql: ${TABLE}.beaconid ;;
  }

  dimension: devicecount {
    type: number
    sql: ${TABLE}.devicecount ;;
  }

  dimension: emailid {
    type: number
    value_format_name: id
    sql: ${TABLE}.emailid ;;
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

  dimension: pageid {
    type: string
    sql: ${TABLE}.pageid ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: weeknum {
    type: date_week
    sql: ${TABLE}.weeknum ;;
  }

  dimension: zip9 {
    type: number
    sql: ${TABLE}.zip9 ;;
  }

  measure: count_HB {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: alc_email.status
      value: "0"
    }
  }

  measure: count_OC {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: alc_email.status
      value: "1"
    }
  }

  measure: count_Rest {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: alc_email.status
      value: "2"
    }
  }

  measure: count_notHBLaunched {
    type: number
    sql:  ${count_OC} + ${count_Rest} ;;
  }

  measure: count_TotalLaunched {
    type: number
    sql:  ${count_OC} + ${count_Rest} + ${count_HB} ;;
  }

  measure: percent_HB {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_HB} / NULLIF(${count_notHBLaunched},0);;
  }

  measure: count_UniqueHash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
  }

  measure: count_UniqueMultiHash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: alc_multisitehashes.hashedemail
      value: "-NULL"
    }
  }

  measure: count_growthUniqueHash {
    type: percent_of_previous
    sql: ${count_UniqueHash} ;;
  }

  measure: count_UniqueMatchedHash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: emailid
      value: "NOT NULL"
    }
  }

  measure: count_UniqueMatchedMultiHash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: alc_multisitehashes.ismatched
      value: "Yes"
    }
  }

  measure: percent_Matched {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_UniqueMatchedHash} / NULLIF(${count_UniqueHash},0);;
  }

  measure: percent_MultiMatched {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_UniqueMatchedMultiHash} / NULLIF(${count_UniqueMultiHash},0);;
  }

  measure: percent_Multi {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_UniqueMultiHash} / NULLIF(${count_UniqueHash},0);;
  }

  measure: count_growthUniqueMatchedHash {
    type: percent_of_previous
    sql: ${count_UniqueMatchedHash} ;;
  }

  measure: count_TotalVisits {
    type: sum
    sql:  ${TABLE}.devicecount ;;
  }

  measure: count_growthTotalVisits {
    type: percent_of_previous
    sql: ${count_TotalVisits} ;;
  }

  measure: count_UniqueMatchedZip9Hash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: alc_email.zip9matched
      value: "Yes"
    }
  }

  measure: count_2mUniqueMatchedHash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: emailid
      value: "NOT NULL"
    }
    filters: {
      field: weeknum
      value: "2 months"
    }
  }

  measure: count_2mUniqueMatchedZip9Hash {
    type: count_distinct
    sql: ${TABLE}.hashedemail ;;
    filters: {
      field: alc_email.zip9matched
      value: "Yes"
    }
    filters: {
      field: weeknum
      value: "2 months"
    }
  }

  measure: percent_MatchedZip9 {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_UniqueMatchedZip9Hash} / NULLIF(${count_UniqueMatchedHash},0);;
  }

  measure: count_growthMatchedZip9 {
    type: percent_of_previous
    sql: ${percent_MatchedZip9} ;;
  }

  measure: percent_2mMatchedZip9 {
    type: number
    value_format: "#.00\%"
    sql: 100.00 * ${count_2mUniqueMatchedZip9Hash} / NULLIF(${count_2mUniqueMatchedHash},0);;
  }
}
