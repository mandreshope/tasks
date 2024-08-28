import 'package:tasks/app/data/local/local.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

class TaskDataSourceImpl implements TaskDataSource {
  TaskDataSourceImpl({required this.isarService});
  IsarService isarService;
  @override
  Future<List<Task>> getAll({SortedBy sort = SortedBy.date}) {
    switch (sort) {
      case SortedBy.date:
        return isarService.isar.tasks.where().sortByDateDesc().findAll();
      case SortedBy.name:
        return isarService.isar.tasks.where().sortByTitleDesc().findAll();
    }
  }

  @override
  Future<bool> add({required TaskDto task}) {
    return isarService.isar.writeTxn(() async {
      await isarService.isar.tasks.put(
        Task(
          id: task.id,
          title: task.title,
          content: task.title,
          date: task.date,
          status: task.status,
        ),
      );
      return true;
    });
  }

  @override
  Future<List<Task>> getAllByStatus({
    required Status status,
    SortedBy sort = SortedBy.date,
  }) {
    switch (sort) {
      case SortedBy.date:
        return isarService.isar.tasks
            .filter()
            .statusEqualTo(status)
            .sortByDateDesc()
            .findAll();
      case SortedBy.name:
        return isarService.isar.tasks
            .filter()
            .statusEqualTo(status)
            .sortByTitleDesc()
            .findAll();
    }
  }

  @override
  Future<Task?> getTaskById({required int id}) {
    return isarService.isar.tasks.get(id);
  }

  @override
  Future<bool> markAsCompleted({required int id}) async {
    return isarService.isar.writeTxn(() async {
      final task = await isarService.isar.tasks.get(id);
      if (task == null) return false;
      task.status = Status.completed;
      await isarService.isar.tasks.put(task);
      return true;
    });
  }

  @override
  Future<bool> markAsInProgress({required int id}) async {
    return isarService.isar.writeTxn(() async {
      final task = await isarService.isar.tasks.get(id);
      if (task == null) return false;
      task.status = Status.inProgress;
      await isarService.isar.tasks.put(task);
      return true;
    });
  }

  @override
  Future<bool> update({required int id, required TaskDto taskDto}) {
    return isarService.isar.writeTxn(() async {
      final task = await isarService.isar.tasks.get(id);
      if (task == null) return false;
      task.status = taskDto.status;
      task.title = taskDto.title;
      task.content = taskDto.content;
      await isarService.isar.tasks.put(task);
      return true;
    });
  }

  @override
  Future<bool> delete({required int id}) {
    return isarService.isar.writeTxn(() async {
      return isarService.isar.tasks.delete(id);
    });
  }
}
