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
