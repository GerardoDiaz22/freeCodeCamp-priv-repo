#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  rg='^[0-9]+$'

  # if a number
  if [[ $1 =~ $rg ]]
  then
    ELEM_NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number=$1" )"
  else
    ELEM_NAME="$($PSQL "SELECT name FROM elements WHERE symbol='$1' OR name='$1' " )"
  fi

  # If not in database
  if [[ -z $ELEM_NAME ]]
  then
    echo I could not find that element in the database.
  else
    # get info
    ELEM_ATOM="$($PSQL "SELECT atomic_number FROM elements WHERE name='$ELEM_NAME' " )"
    ELEM_SYM="$($PSQL "SELECT symbol FROM elements WHERE name='$ELEM_NAME' " )"
    ELEM_TYPE_ID="$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ELEM_ATOM" )"
    ELEM_TYPE="$($PSQL "SELECT type FROM types WHERE type_id=$ELEM_TYPE_ID" )"
    ELEM_MASS="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ELEM_ATOM")"
    ELEM_MELT="$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEM_ATOM" )"
    ELEM_BOIL="$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEM_ATOM" )"
    
    #output
    echo -e "The element with atomic number $ELEM_ATOM is $ELEM_NAME ($ELEM_SYM). It's a $ELEM_TYPE, with a mass of $ELEM_MASS amu. $ELEM_NAME has a melting point of $ELEM_MELT celsius and a boiling point of $ELEM_BOIL celsius."
  fi
fi
