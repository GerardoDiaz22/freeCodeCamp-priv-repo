#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID="$($PSQL " SELECT user_id FROM users WHERE username='$USERNAME' " )"

if [[ ! -z $USER_ID ]]
then
  GAMES_NUM="$($PSQL " SELECT COUNT(*) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME' " )"
  GAMES_BEST="$($PSQL " SELECT MIN(tries) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME' " )"
fi

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME="$($PSQL " INSERT INTO users(username) VALUES('$USERNAME')" )"
  USER_ID="$($PSQL " SELECT user_id FROM users WHERE username='$USERNAME' " )"
else
  echo "Welcome back, $USERNAME! You have played $GAMES_NUM games, and your best game took $GAMES_BEST guesses."
fi

# vars
RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
TEMP_BEST=1
rg='^[0-9]+$'

echo "Guess the secret number between 1 and 1000:"
read NUMBER_GUESSED

while [[ $NUMBER_GUESSED != $RANDOM_NUMBER ]]
do
  TEMP_BEST=$(( $TEMP_BEST + 1 ))
  if [[ ! $NUMBER_GUESSED =~ $rg ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $NUMBER_GUESSED > $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"      
    fi
    if [[ $NUMBER_GUESSED < $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
  fi
  read NUMBER_GUESSED
done
echo "You guessed it in $TEMP_BEST tries. The secret number was $RANDOM_NUMBER. Nice job!"

# save info
UPDATE_BEST="$($PSQL " INSERT INTO games(tries, user_id) VALUES($TEMP_BEST, $USER_ID) " )";
