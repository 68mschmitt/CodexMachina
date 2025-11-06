# CodexMachina Style Guide

## Naming Conventions

### Files and Directories
- Use **kebab-case** for file and directory names
- Use **PascalCase** for class/type names
- Use **camelCase** for function and variable names
- Use **UPPER_SNAKE_CASE** for constants and environment variables

### Comments
- Keep comments minimal and focused on "why", not "what"
- Use inline comments sparingly
- Use block comments for complex logic

## Code Organization

### Project Structure
```
src/
├── components/        # Reusable components
├── services/          # Business logic
├── utils/             # Utility functions
├── types/             # Type definitions
├── hooks/             # Custom hooks (if applicable)
├── constants/         # Constants
└── tests/             # Test files
```

### Import Order
1. Standard library imports
2. Third-party imports
3. Local imports (utilities, constants, types)
4. Relative imports (same directory)

## Language-Specific Conventions

### JavaScript/TypeScript
- Use strict mode
- Use const by default, let when necessary, avoid var
- Use arrow functions for callbacks
- Use async/await over promises
- Prefer template literals over string concatenation

### Python
- Follow PEP 8
- Use type hints
- Use docstrings for modules, classes, and functions
- Prefer list comprehensions over map/filter

## Error Handling

- Always handle errors explicitly
- Use descriptive error messages
- Log errors with context
- Never swallow exceptions silently

## Testing

- Aim for 80%+ code coverage
- Write tests before implementation (TDD)
- Use descriptive test names
- Keep tests isolated and deterministic
- Mock external dependencies

## Documentation

- Keep README.md up to date
- Document public APIs
- Include usage examples
- Link to related documentation
- Update CHANGELOG for all changes

## Performance

- Profile before optimizing
- Avoid premature optimization
- Use appropriate data structures
- Minimize dependencies
- Monitor bundle size

## Security

- Validate all inputs
- Sanitize outputs
- Use environment variables for secrets
- Never commit secrets or credentials
- Keep dependencies updated
