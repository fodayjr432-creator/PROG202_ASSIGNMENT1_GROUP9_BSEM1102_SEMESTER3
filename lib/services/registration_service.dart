import '../models/module.dart';
import '../models/registration.dart';
import '../models/student.dart';

// The RegistrationService keeps all registered students in memory
// (using a List<Student>) and provides the login check.
// It also contains the validation rules used during registration.
class RegistrationService {
  // In-memory storage: this data only exists while the program is running.
  final List<Student> _students = [];
  final List<Registration> _registrations = [];

  /// Stores a newly registered student.
  void registerStudent(Student student) {
    _students.add(student);
  }

  /// Finds a student by their Student ID.
  /// Returns null when no student with that ID exists.
  Student? findStudentById(String studentId) {
    for (final student in _students) {
      if (student.studentId == studentId) {
        return student;
      }
    }
    return null;
  }

  /// Checks the login credentials against the registered students.
  /// Returns the Student when the Student ID and password match,
  /// otherwise returns null (access denied).
  Student? login(String studentId, String password) {
    final Student? student = findStudentById(studentId);
    if (student == null) {
      return null;
    }
    if (student.password != password) {
      return null;
    }
    return student;
  }

  /// Returns the registration record of a student.
  /// A new Registration is created on first login, so registered
  /// subjects are kept even after the student logs out and in again.
  Registration getRegistrationFor(Student student) {
    for (final registration in _registrations) {
      if (registration.student.studentId == student.studentId) {
        return registration;
      }
    }
    final Registration registration = Registration(student);
    _registrations.add(registration);
    return registration;
  }

  List<Module> getSubjectsForClassLevel(String classLevel) {
    return SchoolSubjects.forClassLevel(classLevel);
  }

  bool isAllowedSubjectForStudent(Student student, Module module) {
    return student.classLevel == module.classLevel;
  }

  // ---------------- Validation rules ----------------

  /// A valid name contains letters (A-Z, a-z) and spaces only.
  /// Numbers and symbols such as @ are rejected.
  static bool isValidName(String name) {
    if (name.trim().isEmpty) {
      return false;
    }
    final RegExp pattern = RegExp(r'^[A-Za-z ]+$');
    return pattern.hasMatch(name);
  }

  /// A valid age is a whole number inside the student age range.
  static bool isValidAge(int age) {
    return age >= 11 && age <= 22;
  }

  static bool isValidClassLevel(String classLevel) {
    return SchoolSubjects.classLevels.contains(classLevel);
  }
}
