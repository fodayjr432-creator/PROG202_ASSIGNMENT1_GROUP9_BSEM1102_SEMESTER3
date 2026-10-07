// SLGS Student Registration, Login and Module Offering System
// A console-based Dart prototype for a secondary school.
//
// Program flow:
//   main menu -> register student -> login -> student menu -> logout -> exit

import 'dart:io';

import 'package:slgs_student_registration/models/module.dart';
import 'package:slgs_student_registration/models/registration.dart';
import 'package:slgs_student_registration/models/student.dart';
import 'package:slgs_student_registration/services/registration_service.dart';

void runApp() {
  // The service keeps all registered students in memory while the program runs.
  final RegistrationService service = RegistrationService();

  // No student is logged in when the program starts.
  Student? loggedInStudent;

  bool running = true;
  while (running) {
    displayMainMenu();
    final int? choice = readMenuChoice();

    if (choice == 1) {
      registerStudent(service);
    } else if (choice == 2) {
      loggedInStudent = loginStudent(service);
      if (loggedInStudent != null) {
        final Registration registration = service.getRegistrationFor(loggedInStudent);
        showStudentMenu(registration, service);
        loggedInStudent = null;
      }
    } else if (choice == 3) {
      print('Thank you for using the SLGS Student Registration System.');
      running = false;
    } else {
      print('Invalid choice. Please enter 1, 2 or 3.');
    }
  }
}

// ---------------------------------------------------------------------------
// Main menu
// ---------------------------------------------------------------------------

void displayMainMenu() {
  print('');
  print('========================================');
  print('SLGS STUDENT REGISTRATION SYSTEM');
  print('========================================');
  print('1. Register Student');
  print('2. Login');
  print('3. Exit');
  print('========================================');
  stdout.write('Enter your choice: ');
}

String readClassLevel() {
  print('');
  print('Select your class level:');
  for (int i = 0; i < SchoolSubjects.classLevels.length; i++) {
    print('${i + 1}. ${SchoolSubjects.classLevels[i]}');
  }
  print('========================================');

  while (true) {
    final int? choice = readMenuChoice();
    if (choice == null || choice < 1 || choice > SchoolSubjects.classLevels.length) {
      print('Invalid class choice. Please select a valid number from the list.');
      continue;
    }
    return SchoolSubjects.classLevels[choice - 1];
  }
}

// ---------------------------------------------------------------------------
// Student registration (collects and validates all student information)
// ---------------------------------------------------------------------------

void registerStudent(RegistrationService service) {
  print('');
  print('========================================');
  print('STUDENT REGISTRATION');
  print('========================================');

  // Student ID: must not be empty and must be unique.
  String studentId = readNonEmptyInput('Enter Student ID: ');
  while (service.findStudentById(studentId) != null) {
    print(
        'This Student ID is already registered. Please choose a different Student ID.');
    studentId = readNonEmptyInput('Enter Student ID: ');
  }

  // Name: letters and spaces only.
  String name = readNonEmptyInput('Enter Student Name: ');
  while (!RegistrationService.isValidName(name)) {
    print(
        'Invalid name. Please use letters and spaces only (no numbers or symbols).');
    name = readNonEmptyInput('Enter Student Name: ');
  }

  // Age: whole numbers only, inside the student age range.
  final int age = readAge();

  // Class: must be selected from the available school class levels.
  final String classLevel = readClassLevel();

  // Password: must not be empty and must be entered twice to confirm it.
  String password = readNonEmptyInput('Enter Password: ');
  String confirmPassword = readNonEmptyInput('Confirm Password: ');
  while (password != confirmPassword) {
    print('Passwords do not match. Please enter the password again.');
    password = readNonEmptyInput('Enter Password: ');
    confirmPassword = readNonEmptyInput('Confirm Password: ');
  }

  final Student student = Student(studentId, name, age, classLevel, password);
  service.registerStudent(student);

  print('');
  print('Registration successful. Welcome, ${student.name}!');
  student.displayProfile();
}

// ---------------------------------------------------------------------------
// Login (compares the entered credentials with the registered data)
// ---------------------------------------------------------------------------

Student? loginStudent(RegistrationService service) {
  print('');
  print('========================================');
  print('STUDENT LOGIN');
  print('========================================');

  final String studentId = readInput('Enter Student ID: ');
  final String password = readInput('Enter Password: ');

  final Student? student = service.login(studentId, password);

  if (student == null) {
    print('Invalid Student ID or password.');
    return null;
  }

  print('Login successful. Welcome, ${student.name}!');
  return student;
}

// ---------------------------------------------------------------------------
// Student menu (only reachable after a successful login)
// ---------------------------------------------------------------------------

void showStudentMenu(Registration registration, RegistrationService service) {
  bool inMenu = true;
  while (inMenu) {
    print('');
    print('========================================');
    print('STUDENT MENU');
    print('========================================');
    print('Welcome, ${registration.student.name}!');
    print('Class: ${registration.student.classLevel}');
    print('');
    print('1. View My Profile');
    print('2. View Available Subjects');
    print('3. Register Subjects');
    print('4. View My Registered Subjects');
    print('5. Logout');
    print('========================================');
    stdout.write('Enter your choice: ');

    final int? choice = readMenuChoice();

    if (choice == 1) {
      registration.student.displayProfile();
    } else if (choice == 2) {
      displayAvailableSubjects(registration.student, service);
    } else if (choice == 3) {
      registerModules(registration, service);
    } else if (choice == 4) {
      registration.displayRegisteredModules();
    } else if (choice == 5) {
      print('You have been logged out successfully. Returning to the main menu.');
      inMenu = false;
    } else {
      print('Invalid choice. Please enter a number between 1 and 5.');
    }
  }
}

// ---------------------------------------------------------------------------
// Available subjects
// ---------------------------------------------------------------------------

void displayAvailableSubjects(Student student, RegistrationService service) {
  final List<Module> subjects = service.getSubjectsForClassLevel(student.classLevel);

  print('');
  print('========================================');
  print('AVAILABLE SUBJECTS FOR ${student.classLevel}');
  print('========================================');
  for (int i = 0; i < subjects.length; i++) {
    final Module subject = subjects[i];
    print('${(i + 1)}. ${subject.moduleName}');
  }
  print('========================================');
}

// ---------------------------------------------------------------------------
// Subject selection and registration
// ---------------------------------------------------------------------------

void registerModules(Registration registration, RegistrationService service) {
  final List<Module> subjects = service.getSubjectsForClassLevel(registration.student.classLevel);

  while (true) {
    displayAvailableSubjects(registration.student, service);
    print('Enter the subject numbers you want to register, separated by commas.');
    print('Example: 1,3,5    (enter 0 to return to the student menu)');
    stdout.write('Your selection: ');

    final String? input = stdin.readLineSync();
    if (input == null) {
      print('');
      exit(0);
    }
    final String selection = input.trim();

    if (selection.isEmpty) {
      print('Empty selection. Please enter at least one subject number.');
      continue;
    }
    if (selection == '0') {
      return;
    }

    final List<String> parts = selection.split(',');
    final List<int> selectedNumbers = [];
    bool valid = true;

    for (final part in parts) {
      final String token = part.trim();

      if (token.isEmpty) {
        print('Invalid input: please enter subject numbers separated by commas only.');
        valid = false;
        break;
      }

      final int? number = int.tryParse(token);
      if (number == null) {
        print('Invalid input: "$token" is not a valid subject number.');
        valid = false;
        break;
      }

      if (number < 1 || number > subjects.length) {
        print('Invalid subject number: $number. Please choose a number between 1 and ${subjects.length}.');
        valid = false;
        break;
      }

      if (selectedNumbers.contains(number)) {
        print('Duplicate selection: subject number $number was entered more than once.');
        valid = false;
        break;
      }

      selectedNumbers.add(number);
    }

    if (!valid) {
      continue;
    }

    int alreadyRegistered = 0;
    final List<Module> newlyRegistered = [];
    for (final number in selectedNumbers) {
      final Module subject = subjects[number - 1];
      if (!service.isAllowedSubjectForStudent(registration.student, subject)) {
        print('This subject does not belong to your class level.');
        valid = false;
        break;
      }
      if (!registration.addModule(subject)) {
        alreadyRegistered++;
      } else {
        newlyRegistered.add(subject);
      }
    }

    if (!valid) {
      continue;
    }

    print('');
    print('Registration successful!');
    if (newlyRegistered.isNotEmpty) {
      print('Newly registered subjects:');
      for (final subject in newlyRegistered) {
        print('- ${subject.moduleName}');
      }
    }
    if (alreadyRegistered > 0) {
      print('$alreadyRegistered subject(s) were already registered and were skipped.');
    }
    registration.displayRegisteredModules();
    return;
  }
}

// ---------------------------------------------------------------------------
// Input helpers (validation of keyboard input)
// ---------------------------------------------------------------------------

/// Reads one line from the keyboard.
/// If the input stream ends, the program exits safely instead of crashing.
String readInput(String prompt) {
  stdout.write(prompt);
  final String? input = stdin.readLineSync();
  if (input == null) {
    print('\nInput ended. Exiting the program.');
    exit(0);
  }
  return input;
}

/// Reads input that must not be empty.
String readNonEmptyInput(String prompt) {
  while (true) {
    final String input = readInput(prompt).trim();
    if (input.isNotEmpty) {
      return input;
    }
    print('This field cannot be empty. Please try again.');
  }
}

/// Reads a menu choice. Returns null when the input is not a whole number.
int? readMenuChoice() {
  final String input = readInput('').trim();
  if (input.isEmpty) {
    return null;
  }
  return int.tryParse(input);
}

/// Reads the age: whole numbers only, inside the student age range.
int readAge() {
  while (true) {
    final String input = readInput('Enter Age: ').trim();
    if (input.isEmpty) {
      print('Age cannot be empty. Please try again.');
      continue;
    }
    final int? age = int.tryParse(input);
    if (age == null) {
      print('Invalid age. Please enter a whole number.');
      continue;
    }
    if (!RegistrationService.isValidAge(age)) {
      print('Invalid age. Please enter a whole number between 11 and 22.');
      continue;
    }
    return age;
  }
}
