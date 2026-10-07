// The Student class stores the information of one registered student.
// It demonstrates a Dart class with fields, a constructor and methods.
class Student {
  // Student information fields.
  final String studentId;
  final String name;
  final int age;
  final String classLevel;
  final String password;

  // Constructor: creates a Student object from the registration data.
  Student(this.studentId, this.name, this.age, this.classLevel, this.password);

  // Displays the student's profile (the password is never shown).
  void displayProfile() {
    print('Student ID: $studentId');
    print('Name: $name');
    print('Age: $age');
    print('Class: $classLevel');
  }
}
