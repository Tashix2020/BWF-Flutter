void main() {
  // Different types of variables
  String ehtasham = 'Ehtasham';
  int ehtashamAge = 30;
  double ehtashamHeight = 5.9;
  bool isEhtashamStudent = false;
  List<String> ehtashamSkills = ['Dart', 'Flutter', 'Programming'];

  // Lists
  List<String> ehtashamHobbies = ['Reading', 'Traveling', 'Coding'];

  // Conditional statements
  if (isEhtashamStudent) {
    print('$ehtasham is a student.');
  } else {
    print('$ehtasham is not a student.');
  }

  // Loops
  // For loop
  for (int i = 0; i < ehtashamHobbies.length; i++) {
    print('$ehtasham likes ${ehtashamHobbies[i]}.');
  }

  // For-each loop
  ehtashamHobbies.forEach((hobby) => print('$ehtasham enjoys $hobby.'));

  // While loop
  int index = 0;
  while (index < ehtashamHobbies.length) {
    print('$ehtasham hobby: ${ehtashamHobbies[index]}');
    index++;
  }

  // Classes/objects
  // Creating an instance of the Person class
  Person ehtashamPerson = Person(name: ehtasham, age: ehtashamAge);
  ehtashamPerson.displayInfo();

  // Inheritance
  Student ehtashamStudent =
      Student(name: ehtasham, age: ehtashamAge, major: 'Computer Science');
  ehtashamStudent.displayInfo();

  // Maps
  Map<String, dynamic> ehtashamDetails = {
    'name': ehtasham,
    'age': ehtashamAge,
    'height': ehtashamHeight,
  };
  print(ehtashamDetails);

  // Async await
  fetchEhtashamData().then((data) {
    print(data);
  });

  // Exception handling
  try {
    int result = 10 ~/ 0; // This will throw an exception
    print(result);
  } catch (e) {
    print('Exception caught: $e');
  }

  // Streams
  ehtashamStream().listen((event) {
    print('Stream event: $event');
  });

  // Higher order functions
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> squaredNumbers = numbers.map((num) => num * num).toList();
  print(squaredNumbers);
}

// Class definition
class Person {
  String name;
  int age;

  // Constructor
  Person({required this.name, required this.age});

  // Method to display information
  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

// Inheritance - Student class inherits from Person class
class Student extends Person {
  String major;

  // Constructor
  Student({required String name, required int age, required this.major})
      : super(name: name, age: age);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Major: $major');
  }
}

// Async function
Future<String> fetchEhtashamData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Ehtasham data fetched';
}

// Stream function
Stream<int> ehtashamStream() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// Abstract class
abstract class AbstractPerson {
  void displayInfo();
}

// Exception handling
void exceptionExample() {
  try {
    int result = 10 ~/ 0;
    print(result);
  } catch (e) {
    print('Caught an exception: $e');
  }
}
