import 'package:tasks/app/data/models/task.dart';

abstract class TaskDataSource {
  Future<List<Task>> getAll();
}
