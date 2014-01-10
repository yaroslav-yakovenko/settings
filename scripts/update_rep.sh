#!/bin/bash

# add  repositories
repo="
/var/www/toggle3_remote
/var/www/toggle_inf_down_crons_remote
/var/www/toggle_inf_remote
/var/www/PROFY_FRAMEWORK
/var/www/toggle3
/var/www/toggle_inf_down_installer_local
/var/www/installer_templates
/var/www/web_installer
/var/www/toggle_inf_local
"

for d in $repo; do
	printf "cd $d \n" 
	cd $d
	if  [ -d $d"/.svn" ]
    then
		svn up
		printf "\n "
    else
		if  [ -d $d"/.git" ]
		then
			if echo "$d" | grep -q "/var/www/web_installer"
			then
				printf "git checkout dev \n" 
				git checkout dev
				printf "git pull origin dev \n" 
				git pull origin dev
			else
				printf "git checkout master \n" 
				git checkout master
				printf "git pull origin master \n" 
				git pull origin master
			fi   
			if  echo "$d" | grep -q "/var/www/toggle3"
			then
				printf "git submodule update \n" 
				git submodule update
			fi 
			if  echo "$d" | grep -q "/var/www/toggle_inf_local"
			then
				printf "git submodule update \n" 
				git submodule update
			fi 
		fi 
	fi 
	printf "\n " 
done;
printf "\n \n" 
