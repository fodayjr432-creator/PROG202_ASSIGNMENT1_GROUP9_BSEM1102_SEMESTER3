import 'module.dart';
import 'student.dart';

// The Registration class links one student with the subjects they selected.
// It is responsible for adding subjects, preventing duplicate subjects
// and displaying the registered subjects.
class Registration {
  final Student student;

  // The registered subjects are kept in a private list so that
  // they can only be changed through the addModule method.
  final List<Module> _modules = [];

  Registration(this.student);

  /// Adds a subject to this registration.
  /// Returns true if the subject was added.
  /// Returns false if the subject was already registered (duplicate prevention).
  bool addModule(Module module) {
    // Compare subject codes to detect duplicates.
    for (final registeredModule in _modules) {
      if (registeredModule.moduleCode == module.moduleCode) {
        return false; // this subject is already registered
      }
    }
    _modules.add(module);
    return true;
  }

  bool hasModule(String moduleCode) {
    for (final registeredModule in _modules) {
      if (registeredModule.moduleCode == moduleCode) {
        return true;
      }
    }
    return false;
  }

  /// Displays the student's information together with the registered subjects.
  void displayRegisteredModules() {
    print('========================================');
    print('MY REGISTERED SUBJECTS');
    print('========================================');
    print('Student ID: ${student.studentId}');
    print('Name: ${student.name}');
    print('Class: ${student.classLevel}');
    print('');
    if (_modules.isEmpty) {
      print('You have not registered any subjects yet.');
    } else {
      print('Registered Subjects:');
      for (int i = 0; i < _modules.length; i++) {
        print('${i + 1}. ${_modules[i].moduleCode} - ${_modules[i].moduleName}');
      }
    }
    print('========================================');
  }
}
