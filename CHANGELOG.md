# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-XX

### Added
- Initial release of ValidaCurp Python client
- Support for CURP validation, data retrieval, and calculation
- Support for both API v1 and v2 (v2 recommended)
- Complete test suite with unit tests
- Comprehensive documentation and examples
- Type hints for better IDE support
- GitHub Actions CI/CD pipeline
- Publishing to PyPI

### Features
- `is_valid()` - Validate CURP structure
- `get_data()` - Get CURP information from RENAPO
- `calculate()` - Calculate CURP from personal data
- `get_entities()` - Get list of Mexican entities
- `set_version()` - Switch between API versions
- Custom endpoint support
- Comprehensive error handling

### Dependencies
- Python >= 3.7
- requests >= 2.25.0

## [Unreleased]

### Planned
- Async support with aiohttp
- CLI interface
- Caching support
- Additional validation methods