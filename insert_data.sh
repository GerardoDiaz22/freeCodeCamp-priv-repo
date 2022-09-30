#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL " TRUNCATE TABLE games, teams ")

cat games.csv | while IFS="," read YEAR ROUND WIN OP WINGOALS OPGOALS
do
  # get team_id
  WIN_ID=$($PSQL " SELECT team_id FROM teams WHERE name='$WIN' ")
  OP_ID=$($PSQL " SELECT team_id FROM teams WHERE name='$OP' ")

  if [[ $WIN != 'winner' ]]
  then
    # insert teams
    # if not found
    if [[ -z $WIN_ID ]]
    then
      # insert winner team
      INSERT_WIN=$($PSQL " INSERT INTO teams(name) VALUES('$WIN') ")
      if [[ $INSERT_WIN = 'INSERT 0 1' ]]
      then
        echo Added team: $WIN
      fi
      WIN_ID=$($PSQL " SELECT team_id FROM teams WHERE name='$WIN' ")
    fi

    # if not found
    if [[ -z $OP_ID ]]
    then
      # insert opponent team
      INSERT_OP=$($PSQL " INSERT INTO teams(name) VALUES('$OP') ")
      if [[ $INSERT_OP = 'INSERT 0 1' ]]
      then
        echo Inserted team: $OP
      fi
      OP_ID=$($PSQL " SELECT team_id FROM teams WHERE name='$OP' ")
    fi

    INSERT_GAME=$($PSQL " INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND',$WIN_ID,$OP_ID,$WINGOALS,$OPGOALS) ")
    if [[ $INSERT_GAME = 'INSERT 0 1' ]]
    then
      echo Inserted game: $YEAR $ROUND $WIN-$OP $WINGOALS-$OPGOALS
    fi
  fi

done
