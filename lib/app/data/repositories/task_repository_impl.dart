import 'package:tasks/app/data/local/local.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/data/repositories/repositories.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required this.taskDataSource});
  TaskDataSource taskDataSource;
  @override
  Future<List<Task>> getAll() {
    return taskDataSource.getAll();
  }
}
