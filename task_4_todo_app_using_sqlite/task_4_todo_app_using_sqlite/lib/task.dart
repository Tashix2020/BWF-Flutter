// models/task.dart
class Task {
  int? id;
  String title;
  String status;

  Task({this.id, required this.title, required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'status': status,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      status: map['status'],
    );
  }
}
