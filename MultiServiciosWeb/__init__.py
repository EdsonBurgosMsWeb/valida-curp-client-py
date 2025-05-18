"""
ValidaCurp Client

This library can validate, calculate and obtain CURP information in México.

Copyright (c) Multiservicios Web JCA S.A. de C.V., https://multiservicios-web.com.mx
License: MIT (https://opensource.org/license/MIT)

Author: Joel Rojas <me@hckdrk.mx>
"""


__version__ = "1.0.0"
__author__ = "Edson Burgos"
__email__ = "edsonburgosmacedo@gmail.com"
__license__ = "MIT"

__all__ = ["ValidaCurp", "ValidaCurpException"]

from MultiServiciosWeb.valida_curp import ValidaCurp, ValidaCurpException
