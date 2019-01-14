#!/bin/sh

set -e

if [ $# != 1 ] ; then
	echo "Usage: $0 <hostname>"
	exit 1
fi

hostname="$1"
key="nodes/$hostname.key"
csr="nodes/$hostname.csr"
crt="nodes/$hostname.crt"

if [ ! -f "$key" ] ; then
	openssl genrsa -out $key 4096
	chmod og-rwx $key
fi

openssl req -new -sha256 -key $key \
	-subj "/C=$NODE_COUNTRY/ST=$NODE_STATE/O=$NODE_ORG/CN=$hostname" \
	-out $csr
openssl x509 -req -in $csr -CA $CA_CERT -CAkey $CA_KEY -CAcreateserial \
	-out $crt -days $NODE_DAYS -sha256
