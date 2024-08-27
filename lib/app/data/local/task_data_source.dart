import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

abstract class TaskDataSource {
  Future<List<Task>> getAll({SortedBy sort = SortedBy.date});
  Future<List<Task>> getAllByStatus({
    required Status status,
    SortedBy sort = SortedBy.date,
  });
  Future<Task?> getTaskById({required int id});
  Future<bool> add({required TaskDto task});
  Future<bool> markAsCompleted({required int id});
  Future<bool> markAsInProgress({required int id});
  Future<bool> update({required int id, required TaskDto taskDto});
  Future<bool> delete({required int id});
}
