import 'package:tasks/app/data/local/local.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/data/repositories/repositories.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required this.taskDataSource});
  TaskDataSource taskDataSource;
  @override
  Future<List<Task>> getAll({SortedBy sort = SortedBy.date}) {
    return taskDataSource.getAll(sort: sort);
  }

  @override
  Future<bool> add({required TaskDto task}) {
    return taskDataSource.add(task: task);
  }

  @override
  Future<List<Task>> getAllByStatus({
    required Status status,
    SortedBy sort = SortedBy.date,
  }) {
    return taskDataSource.getAllByStatus(status: status, sort: sort);
  }

  @override
  Future<Task?> getTaskById({required int id}) {
    return taskDataSource.getTaskById(id: id);
  }

  @override
  Future<bool> markAsCompleted({required int id}) {
    return taskDataSource.markAsCompleted(id: id);
  }

  @override
  Future<bool> markAsInProgress({required int id}) {
    return taskDataSource.markAsInProgress(id: id);
  }

  @override
  Future<bool> update({required int id, required TaskDto taskDto}) {
    return taskDataSource.update(id: id, taskDto: taskDto);
  }

  @override
  Future<bool> delete({required int id}) {
    return taskDataSource.delete(id: id);
  }
}
