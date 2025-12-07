# Beyond Awesome Claude Skills

A curated collection of production-ready Claude Skills for various software development tasks.

## What are Claude Skills?

Claude Skills are structured markdown files that guide Claude to perform specific tasks with expertise and consistency. Each skill contains instructions, examples, best practices, and error handling for a particular domain.

## Available Skills

### Development & Architecture
- **api-integration** - Expert guidance for integrating external APIs with proper error handling and security
- **database-schema-designer** - Design and implement optimal database schemas with migrations
- **microservices-architect** - Design and implement microservices architectures

### Quality & Security
- **testing-expert** - Write comprehensive tests (unit, integration, e2e) with high coverage
- **security-auditor** - Perform security audits and identify vulnerabilities
- **code-reviewer** - Conduct thorough code reviews with actionable feedback

### Performance & Optimization
- **performance-optimizer** - Analyze and optimize application performance
- **frontend-performance** - Optimize frontend performance (bundle size, rendering, etc.)

### DevOps & Infrastructure
- **ci-cd-specialist** - Design and implement CI/CD pipelines
- **docker-expert** - Containerize applications with Docker best practices
- **kubernetes-operator** - Deploy and manage applications on Kubernetes

### Documentation & Communication
- **technical-writer** - Create clear, comprehensive technical documentation
- **api-documentation** - Generate and maintain API documentation

## Usage

To use a skill with Claude Code:

1. Reference the skill in your `.claude/` configuration
2. Or simply tell Claude: "Use the [skill-name] skill to..."

Example:
```
Use the api-integration skill to help me integrate the Stripe payment API
```

## Skill Format

Each skill follows this structure:

```markdown
---
name: skill-name
description: Brief description
version: 1.0.0
mcps:
  required: [list-of-required-mcps]
  optional: [list-of-optional-mcps]
triggers:
  - "keywords that activate this skill"
---

# Skill Name

## Purpose
What this skill does

## Capabilities
What it can help with

## Approach
Step-by-step methodology

## Best Practices
Key principles to follow

## Examples
Concrete examples with expected outputs

## Error Handling
Common issues and solutions
```

## Contributing

To add a new skill:

1. Create a new `.md` file in the `skills/` directory
2. Follow the skill format template
3. Include clear examples and best practices
4. Submit a pull request

## License

MIT

---

*You vibe. It ships.*
