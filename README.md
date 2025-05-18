# **ValidaCurp Python Client**

[![PyPI version](https://badge.fury.io/py/valida-curp.svg)](https://badge.fury.io/py/valida-curp)
[![Python versions](https://img.shields.io/pypi/pyversions/valida-curp.svg)](https://pypi.org/project/valida-curp/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

* This library can validate, calculate and obtain CURP information in México.

* Copyright (c) Multiservicios Web JCA S.A. de C.V., https://multiservicios-web.com.mx
* More information: https://valida-curp.com.mx
* License: MIT (https://opensource.org/license/MIT)

## 1. Requirements

- Python 3.7 or later
- requests library
- python-dotenv library

```bash
# Install requests
pip install requests
# Install python-dotenv
pip install python-dotenv
```

## 2. Installation

You can install this package via pip:

```bash
pip install multiserviciosweb
```

## 3. Account

### 3.1. Create an account

Create an account following this link: https://valida-curp.tawk.help/article/registro-de-usuario

### 3.2. Create a project

Create a project following this link: https://valida-curp.tawk.help/article/creaci%C3%B3n-de-proyecto

### 3.3. Get token

Get your token following this link: https://valida-curp.tawk.help/article/obtener-token-llave-privada-proyecto

## **4. Usage**

### 4.1. Import library

```python
from MultiServiciosWeb import ValidaCurp, ValidaCurpException
```

### 4.2. Create instance

You can add your token as the first parameter or having it in your .env file and automatically take the token:

```python
# Add your token as a parameter
valida_curp = ValidaCurp('YOUR-TOKEN')
```

```python
# Agrega tu token en tu archivo .env
TOKEN_VALIDA_API_CURP = 'YOUR-TOKEN'

# Create the instance
valida_curp = ValidaCurp()
```

### 4.3. (Optional) Set API Version

You can set the API version to query. You can set 1 or 2. The default value is 2.

```python
valida_curp.set_version(1)  # 1 or 2
```

## 5. Methods

### 5.1. Validate CURP

`is_valid()` method takes a CURP as a parameter and validates the CURP structure.

```python
valida_curp = ValidaCurp()
validation_result = valida_curp.is_valid('PUT-CURP-HERE')
print(f"Validation result: {validation_result}")
```

Response

```bash
# Successful response
{'valido': True}
# Failed response
{'valido': False}
```

### 5.2. Get CURP data

`get_data()` method takes a CURP as a parameter and consults the CURP information in RENAPO.

```python
valida_curp = ValidaCurp()
curp_data = valida_curp.get_data('PUT-CURP-HERE')
print(f"CURP data: {curp_data}")
```

Response

```json
{
  'Applicant': {
    'CURP': 'BUME980528HDFRCD02',
    'Names': 'EDSON EDIAN',
    'LastName': 'BURGOS',
    'SecondLastName': 'MACEDO',
    'GenderKey': 'H',
    'Gender': 'Hombre',
    'DateOfBirth': '1998-05-28',
    'Nacionality': 'MEX',
    'CodeEntityBirth': 'DF',
    'EntityBirth': 'Ciudad de México',
    'KeyEvidentiaryDocument': 1,
    'EvidentiaryDocument': 'Acta de nacimiento',
    'CurpStatusKey': 'RCN',
    'CurpStatus': 'Registro de cambio no afectando a CURP'
  },
  'EvidentiaryDocument': {
    'YearRegistration': 1998,
    'KeyIssuingEntity': '',
    'KeyMunicipalityRegistration': 15,
    'MunicipalityRegistration': '',
    'Foja': 0,
    'FolioLetter': '',
    'Book': 0,
    'CertificateNumber': 859,
    'RegistrantNumber': 9,
    'RegistrationEntity': 'Ciudad de México',
    'ForeignRegistrationNumber': '',
    'Volume': 0
  }
}
```

### 5.3. Calculate CURP

Calculates the structure of a CURP with provided data.
`calculate()` receives a dictionary with the following keys:
`names`, `lastName`, `secondLastName`, `birthDay`, `birthMonth`, `birthYear`, `gender`, `entity`

```python
result = valida_curp.calculate({
    'names': 'XXXXX XXXXX',
    'lastName': 'XXXXXX',
    'secondLastName': 'XXXXXX',
    'birthDay': '28',
    'birthMonth': '05',
    'birthYear': '1998',
    'gender': 'H',
    'entity': '15',
})
print(result)
```

Response

```json
{
  'curp': 'XXXX980528HDFRCD06'
}
```

### 5.4. Get entities

`get_entities()` method gets the list of entities.

```python
entities = valida_curp.get_entities()
print(entities)
```

Response

```json5
{
  'clave_entidad': [
    {
      'clave_entidad': '01',
      'nombre_entidad': 'AGUASCALIENTES',
      'abreviatura_entidad': 'AS'
    },
    {
      'clave_entidad': '02',
      'nombre_entidad': 'BAJA CALIFORNIA',
      'abreviatura_entidad': 'BC'
    },
    #
    #...
    #more
    #entities
  ]
}
```

## 6. Full example

```python
from valida_curp import Client, ValidaCurpException

try:
    # Initialize client
    valida_curp = Client("YOUR-TOKEN")

    # Validate CURP structure
    print(valida_curp.is_valid('PXNE660720HMCXTN06'))

    # Get CURP data
    print(valida_curp.get_data('PXNE660720HMCXTN06'))

    # Calculate CURP
    print(valida_curp.calculate({
        'names': 'XXXXX XXXXX',
        'lastName': 'XXXXXX',
        'secondLastName': 'XXXXXX',
        'birthDay': '28',
        'birthMonth': '05',
        'birthYear': '1998',
        'gender': 'H',
        'entity': '15',
    }))

    # Get entities
    print(valida_curp.get_entities())

except ValidaCurpException as e:
    print(f"Valida CURP Exception: {e}")
except Exception as e:
    print(f"Request Exception: {e}")
```

## 7. Error Handling

The library raises `ValidaCurpException` for API-related errors:

- Authentication failures (401, 403)
- Bad requests (400)
- Missing required parameters
- Invalid API version

For HTTP-related errors, the standard `requests` exceptions are raised.

## 8. Credits

- Copyright (c) **Multiservicios Web JCA S.A. de C.V.**, https://multiservicios-web.com.mx
- **Author:** Edson burgos <edsonburgosmacedo@gmail.com>

## 9. License

This project is released under the MIT License. See the [LICENSE](./LICENSE) file for details.

## 10. Support

For support, please visit: https://valida-curp.com.mx