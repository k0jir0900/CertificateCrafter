#!/bin/bash

CA_KEY="aconetwork-lab_CA.key"
CA_CERT="aconetwork-lab_CA.crt"
CERT_KEY="wazuh-lab.key"
CERT_CSR="wazuh-lab.csr"
CERT_CRT="wazuh-lab.crt"
DOMAIN="wazuh-lab.aconetwork.cl"

# Function to create a Certificate Authority (CA)
create_ca() {
  CA_DOMAIN="wazuh-lab.aconetwork.cl"
  CA_COUNTRY="CL"
  CA_STATE="Santiago"
  CA_ORGANIZATION="Aconetwork SPA"
  CA_ORG_UNIT="Aconetwork"
  CA_Days=1825
  CA_CN="aconetwork.cl"

  echo ""
  echo "Creating CA key..."
  openssl genrsa -aes256 -out $CA_KEY 2048
  echo ""
  echo "Creating CA certificate..."
  openssl req -x509 -new -nodes -key $CA_KEY -sha256 -days 1825 -subj "/C=$CA_COUNTRY/ST=$CA_STATE/O=$CA_ORGANIZATION/OU=$CA_ORG_UNIT/CN=$CA_CN" -out $CA_CERT

  echo "CA created: $CA_KEY and $CA_CERT"
}

# Function to create a certificate signed by the CA
create_cert() {
  COUNTRY="CL"
  STATE="Santiago"
  ORGANIZATION="Aconetwork SPA"
  ORG_UNIT="Aconetwork"
  CN="aconetwork.cl"

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

sing_cert() {
  echo ""
  echo "Signing certificate with CA..."
  openssl x509 -req -extfile <(printf "subjectAltName=DNS:$DOMAIN") -days 1024 -in $CERT_CSR -CA $CA_CERT -CAkey $CA_KEY -CAcreateserial -out $CERT_CRT -sha256
}

# Display usage instructions
usage() {
  echo "Usage: $0 {create-ca|create-cert|sing-cert|all}"
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
  sing-cert)
    sing_cert
    ;;
    all)
    create_ca
    create_cert
    sing_cert
    ;;
  *)
    usage
    ;;
esac
