#!/bin/bash

### CA Info
CA_KEY="wuachimingo_CA.key"
CA_CERT="wuachimingo_.crt"
CA_Days=1825
CA_DOMAIN="www.wuachimingo.cl"
CA_COUNTRY="CL"
CA_STATE="Santiago"
CA_ORGANIZATION="Wuachimingo"
CA_ORG_UNIT="Wuachimingo"
CA_CN="wuachimingo.cl"

### Cert Info
CERT_KEY="www.wuachimingo.key"
CERT_CSR="www.wuachimingo.csr"
CERT_CRT="www.wuachimingo.crt"
CERT_Days=365
DOMAIN="www.wuachimingo.cl"
COUNTRY="CL"
STATE="Santiago"
ORGANIZATION="Wuachimingo"
ORG_UNIT="Wuachimingo"
CN="wuachimingo.cl"

# Function to create a Certificate Authority (CA)
create_ca() {
  echo ""
  echo "Creating CA key..."
  openssl genrsa -aes256 -out $CA_KEY 2048
  echo ""
  echo "Creating CA certificate..."
  openssl req -x509 -new -nodes -key $CA_KEY -sha256 -days $CA_Days -subj "/C=$CA_COUNTRY/ST=$CA_STATE/O=$CA_ORGANIZATION/OU=$CA_ORG_UNIT/CN=$CA_CN" -out $CA_CERT

  echo "CA created: $CA_KEY and $CA_CERT"
}

# Function to create a certificate signed by the CA
create_cert() {
  echo ""
  echo "Creating key and CSR for $DOMAIN..."
  openssl genrsa -out $CERT_KEY 2048
  openssl req -new -sha256 \
    -key $CERT_KEY \
    -subj "/C=$COUNTRY/ST=$STATE/O=$ORGANIZATION/OU=$ORG_UNIT/CN=$CN" \
    -reqexts SAN \
    -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:$DOMAIN")) \
    -out $CERT_CSR

  echo ""
  echo "Certificate created: $CERT_KEY, $CERT_CSR, and $CERT_CRT"
}

sign_cert() {
  echo ""
  echo "Signing certificate with CA..."
  openssl x509 -req -extfile <(printf "subjectAltName=DNS:$DOMAIN") -days $CERT_Days -in $CERT_CSR -CA $CA_CERT -CAkey $CA_KEY -CAcreateserial -out $CERT_CRT -sha256
}

# Display usage instructions
usage() {
  echo "Usage: $0 {create-ca|create-cert|sign-cert|all}"
  exit 1
}

# Check command-line arguments
if [ $# -ne 1 ]; then
  usage
fi

# Execute the requested operation
case "$1" in
  create-ca)
    create_ca
    ;;
  create-cert)
    create_cert
    ;;
  sign-cert)
    sign_cert
    ;;
    all)
    create_ca
    create_cert
    sign_cert
    ;;
  *)
    usage
    ;;
esac
