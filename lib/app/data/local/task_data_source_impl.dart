import 'package:tasks/app/data/local/local.dart';
import 'package:tasks/app/data/models/task.dart';

class TaskDataSourceImpl implements TaskDataSource {
  TaskDataSourceImpl({required this.isarService});
  IsarService isarService;
  @override
  Future<List<Task>> getAll() {
    throw UnimplementedError();
  }
}
