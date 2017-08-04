connection: "ipmaster-looker"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: beacondtuniquevisits_hash {
  join:  devicetype
  {
    type: left_outer
    sql_on: ${beacondtuniquevisits_hash.devicetype} = ${devicetype.id} ;;
    relationship: many_to_one
  }

  join:  pxcelclient
  {
    type: inner
    sql_on: ${beacondtuniquevisits_hash.beaconid} = ${pxcelclient.beaconid} ;;
    relationship: many_to_one
  }

  join:  client2lookeruser
  {
    type: inner
    sql_on: ${pxcelclient.clientname} = ${client2lookeruser.clientname} ;;
    relationship: many_to_one
  }

  join:  daysperiod
  {
    type: inner
    sql_on: ${beacondtuniquevisits_hash.daynum} = ${daysperiod.id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: client2lookeruser.userattribute
    user_attribute: beacon2company
  }
}

explore: beaconvisits_hash {

  join:  pxcelclient
  {
    type: inner
    sql_on: ${beaconvisits_hash.beaconid} = ${pxcelclient.beaconid} ;;
    relationship: many_to_one
  }

  join:  client2lookeruser
  {
    type: inner
    sql_on: ${pxcelclient.clientname} = ${client2lookeruser.clientname} ;;
    relationship: many_to_one
  }

  join:  daysperiod
  {
    type: inner
    sql_on: ${beaconvisits_hash.daynum} = ${daysperiod.id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: client2lookeruser.userattribute
    user_attribute: beacon2company
  }
}

explore: beaconweeklyvisits_hash {

  join:  pxcelclient
  {
    type: inner
    sql_on: ${beaconweeklyvisits_hash.beaconid} = ${pxcelclient.beaconid} ;;
    relationship: many_to_one
  }

  join:  client2lookeruser
  {
    type: inner
    sql_on: ${pxcelclient.clientname} = ${client2lookeruser.clientname} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: client2lookeruser.userattribute
    user_attribute: beacon2company
  }
}

explore: lookermart_hash {
  join:  devicetype
  {
    type: left_outer
    sql_on: ${lookermart_hash.devicetype} = ${devicetype.id} ;;
    relationship: many_to_one
  }

  join:  pxcelclient
  {
    type: inner
    sql_on: ${lookermart_hash.beaconid} = ${pxcelclient.beaconid} ;;
    relationship: many_to_one
  }

  join:  client2lookeruser
  {
    type: inner
    sql_on: ${pxcelclient.clientname} = ${client2lookeruser.clientname} ;;
    relationship: many_to_one
  }

  join:  daysperiod
  {
    type: inner
    sql_on: ${lookermart_hash.daynum} = ${daysperiod.id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: client2lookeruser.userattribute
    user_attribute: beacon2company
  }
}

explore: pxcelclient {

  join:  client2lookeruser
  {
    type: inner
    sql_on: ${pxcelclient.clientname} = ${client2lookeruser.clientname} ;;
    relationship: many_to_one
  }
}

explore: client2lookeruser {}

explore: daysperiod {}

explore: devicetype {}
