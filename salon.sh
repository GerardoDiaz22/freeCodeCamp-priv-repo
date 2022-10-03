#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n-- Welcome to the Salon --\n"

MAIN_MENU() {
  echo "Our Services:"
  SERVICES
  EXIT
}

SERVICES() {
  LIST_SERVICES="$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")"
  
  echo "Pick a service:"
  echo "$LIST_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo -e "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_REG="$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")"
  if [[ -z $SERVICE_REG ]]
  then
    SERVICES
  else
    echo "Give phone number:"
    read CUSTOMER_PHONE
    PHONE_REG="$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    if [[ -z $PHONE_REG ]]
    then
      echo "Give name:"
      read CUSTOMER_NAME
      INSERT_INFO="$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")"
    else
      CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    fi
    echo "Give time:"
    read SERVICE_TIME
    CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    INSERT_APP="$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')")"
    SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")"
    echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

EXIT() {
  echo "Quitting..."
}

MAIN_MENU