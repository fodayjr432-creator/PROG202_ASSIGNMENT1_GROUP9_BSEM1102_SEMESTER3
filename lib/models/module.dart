// The Module class stores information about one subject offered by SLGS.
class Module {
  final String moduleCode;
  final String moduleName;
  final int credits;
  final String classLevel;

  // Constructor: creates a Module object with a code, a name, credit hours and class.
  Module(this.moduleCode, this.moduleName, this.credits, this.classLevel);

  // Returns a readable description, for example:
  // "SSS2-MAT - Mathematics - 3 Credits"
  @override
  String toString() {
    return '$moduleCode - $moduleName - $credits Credits';
  }
}

class SchoolSubjects {
  static const List<String> classLevels = [
    'JSS1',
    'JSS2',
    'JSS3',
    'SSS1',
    'SSS2',
    'SSS3',
  ];

  static final List<Module> all = [
    // JSS1
    Module('JSS1-ENG', 'English Language', 3, 'JSS1'),
    Module('JSS1-MAT', 'Mathematics', 3, 'JSS1'),
    Module('JSS1-BSC', 'Basic Science', 3, 'JSS1'),
    Module('JSS1-SST', 'Social Studies', 3, 'JSS1'),
    Module('JSS1-CIV', 'Civic Education', 3, 'JSS1'),
    Module('JSS1-ICT', 'Information and Communication Technology', 3, 'JSS1'),
    Module('JSS1-AGR', 'Agricultural Science', 3, 'JSS1'),
    Module('JSS1-BUS', 'Business Studies', 3, 'JSS1'),
    Module('JSS1-FRE', 'French', 3, 'JSS1'),
    Module('JSS1-PHE', 'Physical and Health Education', 3, 'JSS1'),
    Module('JSS1-CCA', 'Cultural and Creative Arts', 3, 'JSS1'),
    Module('JSS1-CRS', 'Christian Religious Studies', 3, 'JSS1'),
    Module('JSS1-IRS', 'Islamic Religious Studies', 3, 'JSS1'),
    Module('JSS1-HOM', 'Home Economics', 3, 'JSS1'),
    Module('JSS1-MUS', 'Music', 3, 'JSS1'),

    // JSS2
    Module('JSS2-ENG', 'English Language', 3, 'JSS2'),
    Module('JSS2-MAT', 'Mathematics', 3, 'JSS2'),
    Module('JSS2-BSC', 'Basic Science', 3, 'JSS2'),
    Module('JSS2-SST', 'Social Studies', 3, 'JSS2'),
    Module('JSS2-CIV', 'Civic Education', 3, 'JSS2'),
    Module('JSS2-ICT', 'Information and Communication Technology', 3, 'JSS2'),
    Module('JSS2-AGR', 'Agricultural Science', 3, 'JSS2'),
    Module('JSS2-BUS', 'Business Studies', 3, 'JSS2'),
    Module('JSS2-FRE', 'French', 3, 'JSS2'),
    Module('JSS2-PHE', 'Physical and Health Education', 3, 'JSS2'),
    Module('JSS2-CCA', 'Cultural and Creative Arts', 3, 'JSS2'),
    Module('JSS2-CRS', 'Christian Religious Studies', 3, 'JSS2'),
    Module('JSS2-IRS', 'Islamic Religious Studies', 3, 'JSS2'),
    Module('JSS2-HOM', 'Home Economics', 3, 'JSS2'),
    Module('JSS2-MUS', 'Music', 3, 'JSS2'),

    // JSS3
    Module('JSS3-ENG', 'English Language', 3, 'JSS3'),
    Module('JSS3-MAT', 'Mathematics', 3, 'JSS3'),
    Module('JSS3-BSC', 'Basic Science', 3, 'JSS3'),
    Module('JSS3-SST', 'Social Studies', 3, 'JSS3'),
    Module('JSS3-CIV', 'Civic Education', 3, 'JSS3'),
    Module('JSS3-ICT', 'Information and Communication Technology', 3, 'JSS3'),
    Module('JSS3-AGR', 'Agricultural Science', 3, 'JSS3'),
    Module('JSS3-BUS', 'Business Studies', 3, 'JSS3'),
    Module('JSS3-FRE', 'French', 3, 'JSS3'),
    Module('JSS3-PHE', 'Physical and Health Education', 3, 'JSS3'),
    Module('JSS3-CCA', 'Cultural and Creative Arts', 3, 'JSS3'),
    Module('JSS3-CRS', 'Christian Religious Studies', 3, 'JSS3'),
    Module('JSS3-IRS', 'Islamic Religious Studies', 3, 'JSS3'),
    Module('JSS3-HOM', 'Home Economics', 3, 'JSS3'),
    Module('JSS3-MUS', 'Music', 3, 'JSS3'),

    // SSS1
    Module('SSS1-ENG', 'English Language', 3, 'SSS1'),
    Module('SSS1-MAT', 'Mathematics', 3, 'SSS1'),
    Module('SSS1-BIO', 'Biology', 3, 'SSS1'),
    Module('SSS1-PHY', 'Physics', 3, 'SSS1'),
    Module('SSS1-CHE', 'Chemistry', 3, 'SSS1'),
    Module('SSS1-ICT', 'Information and Communication Technology', 3, 'SSS1'),
    Module('SSS1-GEO', 'Geography', 3, 'SSS1'),
    Module('SSS1-ECO', 'Economics', 3, 'SSS1'),
    Module('SSS1-GOV', 'Government', 3, 'SSS1'),
    Module('SSS1-CIV', 'Civic Education', 3, 'SSS1'),
    Module('SSS1-LIT', 'Literature in English', 3, 'SSS1'),
    Module('SSS1-ACC', 'Financial Accounting', 3, 'SSS1'),
    Module('SSS1-COM', 'Commerce', 3, 'SSS1'),
    Module('SSS1-AGR', 'Agricultural Science', 3, 'SSS1'),
    Module('SSS1-FRE', 'French', 3, 'SSS1'),

    // SSS2
    Module('SSS2-ENG', 'English Language', 3, 'SSS2'),
    Module('SSS2-MAT', 'Mathematics', 3, 'SSS2'),
    Module('SSS2-BIO', 'Biology', 3, 'SSS2'),
    Module('SSS2-PHY', 'Physics', 3, 'SSS2'),
    Module('SSS2-CHE', 'Chemistry', 3, 'SSS2'),
    Module('SSS2-ICT', 'Information and Communication Technology', 3, 'SSS2'),
    Module('SSS2-GEO', 'Geography', 3, 'SSS2'),
    Module('SSS2-ECO', 'Economics', 3, 'SSS2'),
    Module('SSS2-GOV', 'Government', 3, 'SSS2'),
    Module('SSS2-CIV', 'Civic Education', 3, 'SSS2'),
    Module('SSS2-LIT', 'Literature in English', 3, 'SSS2'),
    Module('SSS2-ACC', 'Financial Accounting', 3, 'SSS2'),
    Module('SSS2-COM', 'Commerce', 3, 'SSS2'),
    Module('SSS2-AGR', 'Agricultural Science', 3, 'SSS2'),
    Module('SSS2-FRE', 'French', 3, 'SSS2'),

    // SSS3
    Module('SSS3-ENG', 'English Language', 3, 'SSS3'),
    Module('SSS3-MAT', 'Mathematics', 3, 'SSS3'),
    Module('SSS3-BIO', 'Biology', 3, 'SSS3'),
    Module('SSS3-PHY', 'Physics', 3, 'SSS3'),
    Module('SSS3-CHE', 'Chemistry', 3, 'SSS3'),
    Module('SSS3-ICT', 'Information and Communication Technology', 3, 'SSS3'),
    Module('SSS3-GEO', 'Geography', 3, 'SSS3'),
    Module('SSS3-ECO', 'Economics', 3, 'SSS3'),
    Module('SSS3-GOV', 'Government', 3, 'SSS3'),
    Module('SSS3-CIV', 'Civic Education', 3, 'SSS3'),
    Module('SSS3-LIT', 'Literature in English', 3, 'SSS3'),
    Module('SSS3-ACC', 'Financial Accounting', 3, 'SSS3'),
    Module('SSS3-COM', 'Commerce', 3, 'SSS3'),
    Module('SSS3-AGR', 'Agricultural Science', 3, 'SSS3'),
    Module('SSS3-FRE', 'French', 3, 'SSS3'),
  ];

  static List<Module> forClassLevel(String classLevel) {
    return all.where((module) => module.classLevel == classLevel).toList();
  }
}
