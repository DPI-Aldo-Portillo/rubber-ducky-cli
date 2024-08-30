# Rubber Ducky

## Introduction

The Rubber Ducky CLI is a command-line application designed to help developers articulate and solve problems by explaining them to a virtual "Rubber Ducky." The application simulates the experience of verbalizing issues to an inanimate object as a method of problem-solving.

## Usage

1. Clone the repository.
2. Run `ruby app/rubber_ducky.rb` to start the CLI.
3. Enter a title for your session.
4. Start explaining your problem to the Rubber Ducky.
5. Type `exit` when you're done.
6. Your session will be saved in the `sessions/` folder.

## Functional Specification

### User Stories

- **As a developer, I want to verbalize my problem to the Rubber Ducky, so that I can better understand the issue and work towards a solution.**
- **As a user, I want to save my sessions, so that I can review them later and track my problem-solving process.**

### Functional Requirements

- The application should accept user input in the form of text.
- The Rubber Ducky should respond with a prompt for the user to continue explaining.
- The session should be saved to a text file for future reference.
- Users can end the session by typing `exit`.

### Testing

To run the tests, execute the following command:

```bash
ruby tests/test_duck_session.rb
```