# SLGS Student Registration and Class-Based Subject Offering System

A console-based Dart prototype for a secondary school student registration and subject selection system.

This application allows a student to register, log in, view available subjects for their class, register subjects, view registered subjects, log out, and exit safely.

> Prototype note: all data is stored in memory while the program runs.

---

## 1. Features

- Student registration with validation
- Student login with Student ID and password
- Class selection from the six school levels:
  - JSS1
  - JSS2
  - JSS3
  - SSS1
  - SSS2
  - SSS3
- Class-based subject filtering
- Register subjects for the student's own class only
- Prevent duplicate subject registration
- View registered subjects
- Logout and safe exit

---

## 2. Requirements

- Dart SDK 3.0.0 or higher
- VS Code or any text editor
- No external packages required

---

## 3. Project Structure

```text
SDK DART PROTOTYPE/
├── main.dart
├── bin/
│   └── slgs_student_registration.dart
├── lib/
│   ├── app.dart
│   ├── models/
│   │   ├── student.dart
│   │   ├── module.dart
│   │   └── registration.dart
│   └── services/
│       └── registration_service.dart
├── README.md
├── pubspec.yaml
├── pubspec.lock
└── .dart_tool/
```

---

## 4. How to Run

1. Open the project folder.
2. Open the terminal in VS Code.
3. Run either command:

```bash
dart run
```

or

```bash
dart run main.dart
```

---

## 5. Classes

### 5.1 Student

Stores the information for one student.

Fields:
- `studentId`
- `name`
- `age`
- `classLevel`
- `password`

Example:
- Student ID: `SLGS001`
- Name: `Foday Kamara`
- Age: `15`
- Class: `SSS2`

### 5.2 Module

Stores a subject for a specific class level.

Fields:
- `moduleCode`
- `moduleName`
- `credits`
- `classLevel`

Example:
- `SSS2-MAT` - `Mathematics` - `3 Credits` - `SSS2`

### 5.3 Registration

Links one student to the subjects they registered.

Responsibilities:
- add a subject
- prevent duplicates
- display registered subjects

### 5.4 RegistrationService

Handles all in-memory storage and validation.

Responsibilities:
- register students
- find a student by ID
- validate login
- return a student's registration
- validate names, ages, and class levels
- enforce class-based subject filtering

---

## 6. Class Levels and Subject Filtering

The school has six class levels:

- JSS1
- JSS2
- JSS3
- SSS1
- SSS2
- SSS3

A student can only register subjects belonging to their own class.

Example:
- JSS1 student sees only JSS1 subjects
- SSS2 student sees only SSS2 subjects

This rule is enforced in the `RegistrationService` as well as in the user interface.

---

## 7. Subject Lists

Subjects are predefined for each level. Students do not type arbitrary subject names.

Examples:

- JSS1 subjects: English Language, Mathematics, Basic Science, Social Studies, Civic Education, etc.
- SSS2 subjects: English Language, Mathematics, Biology, Physics, Chemistry, Geography, Economics, Government, etc.

---

## 8. Registration Rules

The application validates the following:

- Student ID must be unique and not empty
- Name must not be empty and must contain valid letters and spaces
- Age must be a reasonable secondary-school age
- Class must be one of JSS1, JSS2, JSS3, SSS1, SSS2, SSS3
- Password must be entered twice and must match
- Subject selection must be within the student class only
- Duplicate subjects are rejected

---

## 9. How the Student Menu Works

After login, the student sees:

```text
1. View My Profile
2. View Available Subjects
3. Register Subjects
4. View My Registered Subjects
5. Logout
```

After selecting a class-based subject list, the student can register multiple subjects separated by commas.

Example:

```text
1,3,5,8
```

---

## 10. OOP Concepts Demonstrated

- Classes and objects
- Constructors
- Encapsulation with private fields
- Lists and collections
- Relationships between classes
- Methods for behavior and display
- Validation logic in the service layer
- Separation of responsibilities between app, model, and service layers

---

## 11. Testing Scenarios

The system was checked using the following scenarios:

1. Register a JSS1 student and confirm only JSS1 subjects are shown.
2. Register an SSS2 student and confirm only SSS2 subjects are shown.
3. Attempt to register a subject from another class and reject it.
4. Register the same subject twice and prevent duplication.
5. Register a student and log in with the correct Student ID and password.
6. Log in with a wrong password and confirm failure.
7. Log out and return to the main menu.

---

## 12. Design Notes

- The program remains a simple in-memory console application.
- No database or web layer is used.
- The subject list is predefined to keep the school-level structure consistent.
- Class-based filtering is enforced in both the presentation and the service logic.

---

## 13. Run the Application

```bash
dart run
```

or

```bash
dart run main.dart
```
# PROG202_ASSIGNMENT1_GROUP9_BSEM1102_SEMESTER3
