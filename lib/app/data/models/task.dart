import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Task({
    required this.title,
    this.content,
    required this.date,
    required this.status,
  });
  Id id = Isar.autoIncrement;
  late String title;
  String? content;
  late DateTime date;
  @enumerated
  late Status status;
}

extension StatusExt on Status {
  bool get isCompleted => this == Status.completed;
  bool get inProgress => this == Status.inProgress;
}

enum Status {
  completed,
  inProgress,
}

class TaskDto {
  TaskDto({
    required this.title,
    this.content,
    required this.date,
    required this.status,
  });
  final String title;
  final String? content;
  final DateTime date;
  final Status status;
}
