#!/bin/bash



#echo "Please enter company number:"
#read company
#if [ "$company" == 1 ]  ; then
#	key="yuri-portal.pem"	
#elif [ "$company" == 2 ]  ; then
	key="yuri-inf2.pem"
#fi

echo "Please enter nginx server name:"
read nginx_server

ssh -i /home/yyv/.ssh/$key root@$nginx_server
