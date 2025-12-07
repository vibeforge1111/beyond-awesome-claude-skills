---
name: technical-writer
description: Create clear, comprehensive technical documentation including READMEs, API docs, guides, and tutorials
version: 1.0.0
author: claude-skills-generator
mcps:
  required:
    - filesystem
  optional:
    - git
    - github
capability_level: expert
domain: documentation
tags:
  - documentation
  - writing
  - technical-writing
  - readme
  - api-docs
triggers:
  - "write documentation"
  - "create a README"
  - "document this API"
  - "write a guide"
  - "improve documentation"
---

# Technical Writer

## Purpose

Create professional, clear, and comprehensive technical documentation that helps users understand and use software effectively. Covers READMEs, API documentation, tutorials, guides, and inline code documentation.

## When to Use

Use this skill when:
- Creating README files for projects
- Documenting APIs and endpoints
- Writing user guides and tutorials
- Improving existing documentation
- Creating architecture decision records (ADRs)
- Writing onboarding documentation
- Documenting configuration and setup processes

## Instructions

### Step 1: Understand the Audience

First, identify who will read this documentation:
- **Developers**: Focus on technical details, code examples, API references
- **End Users**: Focus on features, how-tos, screenshots, simple language
- **Operators**: Focus on deployment, configuration, monitoring
- **Contributors**: Focus on architecture, contribution guidelines, development setup

### Step 2: Gather Context

Before writing, collect:
- **Code structure**: Review the actual implementation
- **Existing docs**: Check what already exists
- **User questions**: Common issues from GitHub issues, support tickets
- **Examples**: Real usage examples from the codebase

### Step 3: Choose the Right Format

| Document Type | Structure |
|---------------|-----------|
| **README** | Project overview → Installation → Quick start → Features → Usage → Contributing |
| **API Docs** | Endpoint → Method → Parameters → Request example → Response example → Errors |
| **Tutorial** | Learning goal → Prerequisites → Step-by-step instructions → Verification → Next steps |
| **Guide** | Overview → Concepts → How-to sections → Best practices → Troubleshooting |
| **ADR** | Context → Decision → Consequences → Status |

### Step 4: Write with Clarity

**Principles:**
- Use active voice ("Run the command" not "The command should be run")
- Start with action verbs (Create, Install, Configure, Deploy)
- One concept per paragraph
- Examples before abstractions
- Show, don't just tell (code examples, screenshots)

**Structure:**
1. **Title**: Clear and descriptive
2. **Introduction**: What and why (2-3 sentences)
3. **Prerequisites**: What's needed before starting
4. **Instructions**: Step-by-step, numbered
5. **Examples**: Real, working code
6. **Troubleshooting**: Common issues and solutions
7. **Next Steps**: What to read/do next

### Step 5: Add Code Examples

Every code example should:
- Be runnable (don't use placeholder values without explanation)
- Include language syntax highlighting
- Show expected output
- Explain what it does

**Format:**
```language
// Brief comment explaining what this does
code here
```

**Output:**
```
expected output here
```

### Step 6: Review and Refine

**Checklist:**
- [ ] All links work and point to correct locations
- [ ] Code examples are tested and working
- [ ] No jargon without explanation
- [ ] Clear headings and hierarchy
- [ ] Consistent formatting
- [ ] Spell check passed
- [ ] Screenshots are up-to-date (if applicable)

## Examples

### Example 1: Creating a README

**User:** "Create a README for this Express.js API project"

**Expected behavior:**
1. Scan the codebase to understand:
   - Package.json for dependencies and scripts
   - Entry point (app.js, index.js, server.js)
   - Routes and endpoints
   - Environment variables needed
   - Database setup requirements

2. Create README with sections:
   ```markdown
   # Project Name

   Brief description (what it does, why it exists)

   ## Features
   - Feature 1
   - Feature 2

   ## Installation
   ```bash
   npm install
   cp .env.example .env
   # Edit .env with your values
   ```

   ## Quick Start
   ```bash
   npm run dev
   ```

   ## API Endpoints

   ### GET /api/users
   Returns list of users...

   ## Environment Variables
   - `DATABASE_URL` - PostgreSQL connection string
   - `JWT_SECRET` - Secret for JWT signing

   ## Development
   ```bash
   npm run test
   npm run lint
   ```

   ## Deployment
   ...

   ## License
   MIT
   ```

### Example 2: API Documentation

**User:** "Document this API endpoint for creating users"

**Expected behavior:**
1. Examine the route handler code
2. Identify: method, path, auth requirements, request body, responses
3. Create documentation:

```markdown
### POST /api/users

Creates a new user account.

**Authentication:** Required (Bearer token)

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securepassword123",
  "name": "John Doe"
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| email | string | Yes | Valid email address |
| password | string | Yes | Min 8 characters |
| name | string | No | User's display name |

**Success Response (201 Created):**
```json
{
  "id": "user_123",
  "email": "user@example.com",
  "name": "John Doe",
  "createdAt": "2024-01-15T10:30:00Z"
}
```

**Error Responses:**

| Status | Code | Description |
|--------|------|-------------|
| 400 | INVALID_EMAIL | Email format is invalid |
| 400 | WEAK_PASSWORD | Password must be 8+ characters |
| 409 | EMAIL_EXISTS | Email already registered |
| 401 | UNAUTHORIZED | Invalid or missing auth token |

**Example:**
```bash
curl -X POST https://api.example.com/api/users \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "securepassword123",
    "name": "John Doe"
  }'
```
```

### Example 3: Tutorial

**User:** "Write a tutorial for setting up authentication"

**Expected behavior:**
Create a step-by-step tutorial:

```markdown
# Adding Authentication to Your App

Learn how to add secure user authentication with JWT tokens.

**What you'll build:** A login/signup system with protected routes

**Time:** ~30 minutes

**Prerequisites:**
- Node.js 18+
- Basic Express.js knowledge
- PostgreSQL database running

## Step 1: Install Dependencies

```bash
npm install bcrypt jsonwebtoken dotenv
```

**What these do:**
- `bcrypt` - Hash passwords securely
- `jsonwebtoken` - Create and verify JWT tokens
- `dotenv` - Manage environment variables

## Step 2: Create User Model

Create `models/User.js`:
```javascript
// User model with password hashing
const bcrypt = require('bcrypt');

class User {
  static async create({ email, password }) {
    const hashedPassword = await bcrypt.hash(password, 10);
    // Save to database...
  }

  async verifyPassword(password) {
    return bcrypt.compare(password, this.hashedPassword);
  }
}
```

## Step 3: Create Auth Middleware
...

## Verification

Test your auth setup:
```bash
# Register a user
curl -X POST http://localhost:3000/auth/register \
  -d '{"email":"test@example.com","password":"test123"}'

# Login
curl -X POST http://localhost:3000/auth/login \
  -d '{"email":"test@example.com","password":"test123"}'

# Should return a JWT token
```

## Next Steps
- Add password reset functionality
- Implement refresh tokens
- Add OAuth providers (Google, GitHub)
```

## Documentation Patterns

### README Structure

```markdown
# Project Name

One-line description

[Badges: build status, coverage, version]

## Features
- Key feature 1
- Key feature 2

## Quick Start
Fastest path to running the project (2-3 commands)

## Installation
Detailed setup instructions

## Usage
Common use cases with examples

## Configuration
Environment variables, config files

## API Reference
If applicable

## Development
How to contribute, run tests, etc.

## Deployment
How to deploy to production

## Troubleshooting
Common issues and solutions

## License
```

### API Endpoint Pattern

```markdown
### METHOD /path/to/endpoint

Brief description (one sentence)

**Authentication:** Required/Optional/Not required

**Request:**
- Headers
- Query parameters
- Body

**Response:**
- Success cases
- Error cases

**Example:**
Working curl/code example
```

### Configuration Documentation

```markdown
## Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| VAR_NAME | Yes | - | What it does |
| VAR_NAME | No | value | What it does |

**Example `.env` file:**
```env
VAR_NAME=value
```
```

## Error Handling

| Error | Cause | Solution |
|-------|-------|----------|
| Documentation is too technical | Using jargon without explanation | Add glossary, explain terms on first use |
| Examples don't work | Copy-paste errors, outdated code | Test every example, use CI to verify docs |
| Missing prerequisites | Assumed knowledge | Always list what users need before starting |
| Unclear steps | Too much in one step | Break into smaller, atomic steps |
| No troubleshooting section | Didn't anticipate issues | Review support tickets, add common problems |

## Best Practices

### Writing Style

✅ **Do:**
- Use active voice: "Click the button" not "The button should be clicked"
- Start with verbs: "Install", "Configure", "Deploy"
- Be specific: "Run `npm install`" not "Install the dependencies"
- Show examples before explaining: Code first, then explanation
- Use consistent terminology: Pick one term and stick with it

❌ **Don't:**
- Use passive voice unnecessarily
- Assume prior knowledge
- Use "simply" or "just" (what's simple for you may not be for others)
- Leave placeholders without explanation
- Mix tenses within a section

### Code Examples

✅ **Do:**
```javascript
// Create a new user with hashed password
const user = await User.create({
  email: 'user@example.com',
  password: 'securepass123'
});
// Returns: { id: '123', email: 'user@example.com', createdAt: '...' }
```

❌ **Don't:**
```javascript
// Do something with users
const user = doSomething(params);
```

### Structure

✅ **Do:**
- Use clear hierarchical headings (H1 → H2 → H3)
- Group related information together
- Put most important information first
- Use tables for structured data
- Use lists for steps or items

❌ **Don't:**
- Skip heading levels (H1 → H3)
- Mix unrelated topics in one section
- Bury critical information deep in the doc
- Use paragraphs for data that should be tabular

## References

- [Google Developer Documentation Style Guide](https://developers.google.com/style)
- [Write the Docs](https://www.writethedocs.org/)
- [Microsoft Writing Style Guide](https://learn.microsoft.com/en-us/style-guide/welcome/)
- [Documentation Best Practices](https://documentation.divio.com/)
