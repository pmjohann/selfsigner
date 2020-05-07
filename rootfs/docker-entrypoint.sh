#!/bin/sh

# SET DEFAULT RSA BITSIZE TO SAFE 4096 BITS
RSA_BITSIZE=4096

# SET DEFAULT VALIDITY TO ~10 YEARS
VALIDITY_DAYS=3650

# OVERRIDE RSA_BITSIZE IF NEEDED
if [ -n $2 ]; then
    RSA_BITSIZE=$2
fi

# OVERRIDE VALIDITY IF NEEDED
if [ -n $3 ]; then
    VALIDITY_DAYS=$3
fi

# CREATE REQUEST FILE FOR DOMAIN PASSED
cat /req.conf | sed "s/__DOMAIN__/$1/g" > /tmp/req.conf

# CREATE KEY AND CERT BASED ON REQUEST
openssl req -x509 -nodes -days $VALIDITY_DAYS -newkey rsa:$RSA_BITSIZE -keyout /out/key.pem -out /out/cert.pem -config /tmp/req.conf

# VALIDATE GENERATED CERT
openssl x509 -in /out/cert.pem -noout -text
