#!/bin/bash

printf "$1:$(openssl passwd -crypt $2)\n" >> ./htpasswd
#echo -e "$1:`perl -le 'print crypt(\"$2\",\"\")'`" >> ./htpasswd

