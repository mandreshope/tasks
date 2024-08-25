import 'package:tasks/app/data/models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getAll();
}
