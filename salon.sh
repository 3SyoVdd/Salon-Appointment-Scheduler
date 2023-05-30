#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"


HAUPT_MENUE_FUNCTION (){
# if called with argument
if [[ $1 ]]
then
    #then output argument
    echo -e "\n$1\n"
else
    #else output standard message
    echo -e "\nWelcome to My Salon, how can I help you?\n"
fi



# -t option to prevent  header
PSQL="psql --username=freecodecamp --dbname=salon -t -c"

SERVICES=$($PSQL "SELECT service_id, name from services")
  
  echo "$SERVICES" | while read SERVICE_NUM STRICHOBSOLET SERVICE_NAME
  do
    echo "$SERVICE_NUM) $SERVICE_NAME"
  done

read SERVICE_ID_SELECTED


#If isNumeric() 
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then  
   HAUPT_MENUE_FUNCTION "Requested Service not Found. Please select Service."
else
  
  SERVICE_NAME=$($PSQL"SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    HAUPT_MENUE_FUNCTION "Requested Service not Found. Please select different Service."

  fi

fi


#Selected Service Number is valid
#check Phone Number
echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL"SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
	# add name and number to customer table and get id of this record
    CUSTOMER_ID_OUTPUT=$($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME', '$CUSTOMER_PHONE') returning customer_id");
	#echo $CUSTOMER_ID
#get just the number from returned output. (To avoid additional Request Due to Timeout Issues of CodeAlly)
# Ihate BASH sooo much!
# This line took more than 80% of the whole Projects Time
CUSTOMER_ID=$(echo $CUSTOMER_ID_OUTPUT |grep -o ^[0-9]*)

#CUSTOMER_ID=$(echo "$CUSTOMER_ID_OUTPUT"|cut -d ' ' -f1|tr '\n' ' ')
#echo CUSTOMER_ID $CUSTOMER_ID;

#$ grep insert <<< "$line"

#$ grep -E "s/([0-9]+).*/\1/p" 

#echo " $CUSTOMER_ID_OUTPUT" | while read EINS ZWEI DREI
  #do
   #  echo "EINS="$EINS
   #  $CUSTOMER_ID = $EINS
  #   break
   #  echo "ZWEI="$ZWEI
 # done

#echo CUSTOMER_ID nach schleife $CUSTOMER_ID


# echo " $CUSTOMER_ID" | while read SERVICE_NUM STRICHOBSOLET SERVICE_NAME
#  do
#    echo "$SERVICE_NUM) $SERVICE_NAME"
#  done




#echo "$CUSTOMER_ID" | read VIER FUENF
#  echo "EINS="$VIER
#  echo "ZWEI="$FUENF
 



  else
   CUSTOMER_NAME=$($PSQL"SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

echo -e "\nWhat time would you like your$SERVICE_NAME, $CUSTOMER_NAME?"

#insert into appointments
 read SERVICE_TIME
  INSERT_INTO_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")



 echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
exit

# /end of HAUPT_MENUE_FUNCTION
}

HAUPT_MENUE_FUNCTION

#echo psql --username=freecodecamp --dbname=salon -c "SQL QUERY HERE"

#PSQL="psql --username=freecodecamp --dbname=salon -c"
#echo $PSQL
#echo $($PSQL select * from services;)
