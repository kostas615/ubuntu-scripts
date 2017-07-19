#!/bin/bash

ROOT_UID=0
SUCCESS=0
E_USEREXISTS=70

# Check if root
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

#test if both arguments are there
if [ $# -eq 2 ]; then
username=$1
pass=$2

	# Check if user already exists.
	grep -q "$username" /etc/passwd
	if [ $? -eq $SUCCESS ] 
	then	
	echo "User $username does already exist."
  	echo "please chose another username."
	exit $E_USEREXISTS
	fi  


	useradd -p `mkpasswd "$pass"` --no-create-home --ingroup wok-user

	echo "The account is successfully created!"

else
        echo  " User creation needs 2 arguments, you have given $#. "
        echo  " Call the script $0 username and the pass "
fi

exit 0
