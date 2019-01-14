#!/bin/sh

set -e

if [ -f "$CA_KEY" ] ; then
	echo "$CA_KEY already exists"
	exit 1
elif [ -f "$CA_CERT" ] ; then
	echo "$CA_KEY already exists"
	exit 1
fi

openssl genrsa -des3 -out $CA_KEY 4096
chmod og-rwx $CA_KEY
openssl req -x509 -new -nodes -key $CA_KEY -sha256 -days $CA_DAYS \
	-subj "/C=$CA_COUNTRY/ST=$CA_STATE/O=$CA_ORG/CN=$CA_COMMONNAME" \
	-out $CA_CERT
