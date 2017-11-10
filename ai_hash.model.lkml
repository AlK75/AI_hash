connection: "ipmaster-looker"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: beacondtuniquevisits_hash {
  join:  awbeacon
  {
    type: inner
    sql_on: ${beacondtuniquevisits_hash.beaconid} = ${awbeacon.beaconid} AND ${beacondtuniquevisits_hash.siteid} = ${awbeacon.siteid}  ;;
    relationship: many_to_one
  }

  join:  devicetype
  {
    type: left_outer
    sql_on: ${beacondtuniquevisits_hash.devicetype} = ${devicetype.id} ;;
    relationship: many_to_one
  }

  join:  daysperiod
  {
    type: inner
    sql_on: ${beacondtuniquevisits_hash.daynum} = ${daysperiod.id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: awbeacon.userattribute
    user_attribute: beacon2company
  }
}

explore: beaconvisits_hash {
  join:  awbeacon
  {
    type: inner
    sql_on: ${beaconvisits_hash.beaconid} = ${awbeacon.beaconid} AND ${beaconvisits_hash.siteid} = ${awbeacon.siteid}  ;;
    relationship: many_to_one
  }

  join:  daysperiod
  {
    type: inner
    sql_on: ${beaconvisits_hash.daynum} = ${daysperiod.id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: awbeacon.userattribute
    user_attribute: beacon2company
  }
}

explore: beacondailyvisits_hash {
  join:  awbeacon
  {
    type: inner
    sql_on: ${beacondailyvisits_hash.beaconid} = ${awbeacon.beaconid} AND ${beacondailyvisits_hash.siteid} = ${awbeacon.siteid}  ;;
    relationship: many_to_one
  }

  access_filter: {
    field: awbeacon.userattribute
    user_attribute: beacon2company
  }
}

explore: beaconweeklyvisits_hash {
  join:  awbeacon
  {
    type: inner
    sql_on: ${beaconweeklyvisits_hash.beaconid} = ${awbeacon.beaconid} AND ${beaconweeklyvisits_hash.siteid} = ${awbeacon.siteid}  ;;
    relationship: many_to_one
  }

  access_filter: {
    field: awbeacon.userattribute
    user_attribute: beacon2company
  }
}

explore: lookermart_hash {
  join:  awbeacon
  {
    type: inner
    sql_on: ${lookermart_hash.beaconid} = ${awbeacon.beaconid} AND ${lookermart_hash.siteid} = ${awbeacon.siteid}  ;;
    relationship: many_to_one
  }

  join:  devicetype
  {
    type: left_outer
    sql_on: ${lookermart_hash.devicetype} = ${devicetype.id} ;;
    relationship: many_to_one
  }

  join:  daysperiod
  {
    type: inner
    sql_on: ${lookermart_hash.daynum} = ${daysperiod.id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: awbeacon.userattribute
    user_attribute: beacon2company
  }
}

explore: daysperiod {}

explore: devicetype {}

explore: demosummary_hash
{
  join:  awbeacon
  {
    type: inner
    sql_on: ${demosummary_hash.beaconid} = ${awbeacon.beaconid} AND ${demosummary_hash.siteid} = ${awbeacon.siteid}  ;;
    relationship: many_to_one
  }

  join:  daysperiod
  {
    type: inner
    sql_on: ${demosummary_hash.daynum} = ${daysperiod.id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: awbeacon.userattribute
    user_attribute: beacon2company
  }

}

explore: alc {
  join:  awbeacon
  {
    type: inner
    sql_on: ${alc.beaconid} = ${awbeacon.beaconid} AND ${alc.siteid} = ${awbeacon.siteid}  ;;
    relationship: many_to_one
  }

  join:  alc_email
  {
    type: left_outer
    sql_on: ${alc.zip9} = ${alc_email.zip9} AND ${alc.emailid} = ${alc_email.emailid}  ;;
    relationship: many_to_one
  }

  access_filter: {
    field: awbeacon.userattribute
    user_attribute: beacon2company
  }
}

explore: alc_email {}
