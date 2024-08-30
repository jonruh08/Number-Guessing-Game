#!/bin/bash

# variable to query database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# promp player for username
echo -e "\nEnter your username:"
read USERNAME

# get username data
USER_QUERY=$($PSQL "SELECT * FROM players WHERE username='$USERNAME'")

# if player is not found
if [[ -z $USER_QUERY ]]
  then
    # greet player
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
    # add player to database
    INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO players(username) VALUES ('$USERNAME')")
  else
    
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games INNER JOIN players USING(user_id) WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games INNER JOIN players USING(user_id) WHERE username='$USERNAME'")
    echo Welcome back, $USERNAME\! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=1

RANDOM_NUMBER=$((1 + $RANDOM % 1000))

while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS
done

while [[ $GUESS != $RANDOM_NUMBER ]]
do 
  if [[ $GUESS > $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
    ((NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1))
  else
    echo "It's higher than that, guess again:"
    read GUESS
    ((NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1))
  fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

USER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(secret_number, number_of_guesses, user_id) VALUES ($RANDOM_NUMBER,$NUMBER_OF_GUESSES,$USER_ID)")