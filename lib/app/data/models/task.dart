import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  late String title;
  String? content;
  late DateTime date;
  @enumerated
  late Status status;
}

enum Status {
  completed,
  inProgress,
}
