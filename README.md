# Cert Manager Script

Este script bash se utiliza para gestionar la creación de una Autoridad de Certificación (CA) y la generación de certificados SSL firmados por esta CA para un dominio específico.

## Archivos Generados

- `wuachimingo_CA.key`: Clave privada de la CA.
- `wuachimingo_.crt`: Certificado de la CA.
- `www-wuachimingo.key`: Clave privada para el dominio especificado.
- `www-wuachimingo.csr`: Solicitud de firma de certificado (CSR) para el dominio especificado.
- `www-wuachimingo.crt`: Certificado firmado para el dominio especificado.

## Requisitos

Asegúrate de tener `openssl` instalado en tu sistema.

## Uso

### 1. Guardar el script

Guarda el contenido del script en un archivo llamado `cert_manager.sh`.

### 2. Dar permisos de ejecución

Otorga permisos de ejecución al archivo con el siguiente comando:

```bash
chmod +x cert_manager.sh
```
### 3. Ejecutar el script
El script acepta cuatro comandos diferentes:

`create-ca`: Crea una Autoridad de Certificación (CA).
`create-cert`: Crea una solicitud de firma de certificado (CSR) y una clave privada para el dominio.
`sign-cert`: Firma el CSR con la CA para generar un certificado.
`all`: Ejecuta todas las operaciones anteriores en secuencia.

## Ejemplos de Uso
### Crear una CA:

```bash
./cert_manager.sh create-ca
```
### Crear un certificado para un dominio:

```bash
./cert_manager.sh create-cert
```
### Firmar el certificado con la CA:

```bash
./cert_manager.sh sign-cert
```
### Ejecutar todas las operaciones:

```bash
./cert_manager.sh all
```
