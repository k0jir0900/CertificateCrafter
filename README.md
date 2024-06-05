# CertificateCrafter

Este script simplifica la creación de una Autoridad Certificadora (CA) y la generación de certificados SSL firmados por esta CA para un dominio. Generando certificados autofirmados que serán reconocidos como validos.

## Archivos Generados

- `wuachimingo_CA.key`: Clave privada de la CA.
- `wuachimingo_CA.crt`: Certificado de la CA.
- `wuachimingo.key`: Clave privada para el dominio especificado.
- `wuachimingo.csr`: Solicitud de firma de certificado (CSR) para el dominio especificado.
- `wuachimingo.crt`: Certificado firmado para el dominio especificado.

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
### 3. Definir información de los certificados

Para definir la información de la CA y certificado, se debe editar el archivo `cert_manager.sh` modificando las secciones "CA Info" y "Cert Info" con los datos del certificado a crear.

## Información de la CA

| Variable      | Descripción                                                           |
|---------------|-----------------------------------------------------------------------|
| CA_KEY        | La clave privada de la autoridad certificadora (CA).                  |
| CA_CERT       | El certificado público de la CA.                                      |
| CA_Days       | La validez del certificado de la CA en días.                          |
| CA_DOMAIN     | El dominio asociado con la CA.                                        |
| CA_COUNTRY    | El código del país para la CA.                                        |
| CA_STATE      | El estado o provincia para la CA.                                     |
| CA_ORGANIZATION | El nombre de la organización que emite el certificado de la CA.      |
| CA_ORG_UNIT   | La unidad organizativa dentro de la organización de la CA.            |
| CA_CN         | El nombre común (Common Name) de la CA.                               |

## Información del Certificado

| Variable      | Descripción                                                           |
|---------------|-----------------------------------------------------------------------|
| CERT_KEY      | La clave privada del certificado específico.                          |
| CERT_CSR      | La solicitud de firma de certificado (CSR).                           |
| CERT_CRT      | El certificado público resultante después de que la CA firma la CSR.  |
| CERT_Days     | La validez del certificado en días.                                   |
| DOMAIN        | El dominio asociado con el certificado.                               |
| COUNTRY       | El código del país asociado con el certificado.                       |
| STATE         | El estado o provincia asociado con el certificado.                    |
| ORGANIZATION  | El nombre de la organización a la que pertenece el certificado.       |
| ORG_UNIT      | La unidad organizativa dentro de la organización asociada.            |
| CN            | El nombre común (Common Name) del certificado.                        |

### 4. Ejecutar el script
El script acepta cuatro comandos diferentes:

| Comando       | Descripción                                                           |
|---------------|-----------------------------------------------------------------------|
| `create-ca`   | Crea una Autoridad de Certificación (CA).                  |
| `create-cert` | Crea una solicitud de firma de certificado (CSR) y una clave privada para el dominio.                                      |
| `sign-cert`   | Firma el CSR con la CA para generar un certificado.                         |
| `all`         | Ejecuta todas las operaciones anteriores en secuencia.                                     |

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
