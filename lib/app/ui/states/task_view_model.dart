import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/data/providers/task_provider.dart';
import 'package:tasks/app/data/repositories/repositories.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

final taskViewModelProvider =
    StateNotifierProvider.autoDispose<TaskViewModel, TaskViewState>((ref) {
  return TaskViewModel(ref: ref);
});

class TaskViewModel extends StateNotifier<TaskViewState> {
  TaskViewModel({required this.ref}) : super(const TaskViewState()) {
    taskRepository = ref.read(taskRepositoryProvider);
  }
  final StateNotifierProviderRef<TaskViewModel, TaskViewState> ref;
  late TaskRepository taskRepository;

  Future<void> getTasks({SortedBy sort = SortedBy.date}) async {
    try {
      state = state.copyWith(status: TaskViewStatus.loading);
      final tasks = await taskRepository.getAll(sort: sort);
      if (tasks.isEmpty) {
        state = state.copyWith(status: TaskViewStatus.empty);
      } else {
        state = state.copyWith(status: TaskViewStatus.success);
      }

      state = state.copyWith(tasks: tasks);
    } catch (e) {
      state = state.copyWith(status: TaskViewStatus.error);
      debugPrint('$e');
    }
  }

  Future<void> getTaskByStatus({
    required Status status,
    SortedBy sort = SortedBy.date,
  }) async {
    try {
      state = state.copyWith(status: TaskViewStatus.loading);
      final tasks =
          await taskRepository.getAllByStatus(status: status, sort: sort);
      if (tasks.isEmpty) {
        state = state.copyWith(status: TaskViewStatus.empty);
      } else {
        state = state.copyWith(status: TaskViewStatus.success);
      }
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      state = state.copyWith(status: TaskViewStatus.error);
      debugPrint('$e');
    }
  }

  void taskSelected({required Task task}) => state = state.copyWith(task: task);

  Future<void> getTaskById({required int id}) async {
    try {
      state = state.copyWith(status: TaskViewStatus.loading);
      final task = await taskRepository.getTaskById(id: id);
      state = state.copyWith(status: TaskViewStatus.success);
      state = state.copyWith(task: task);
    } catch (e) {
      state = state.copyWith(status: TaskViewStatus.error);
      debugPrint('$e');
    }
  }

  Future<void> addTask({required String title, String? content}) async {
    try {
      final taskDto = TaskDto(
        title: title,
        content: content,
        date: DateTime.now().toUtc(),
        status: Status.inProgress,
      );
      await taskRepository.add(task: taskDto);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> markAsCompleted({required int id}) async {
    try {
      final tasks = await taskRepository.markAsCompleted(id: id);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
      debugPrint('$tasks');
    } catch (e) {
      debugPrint('$e');
    }
  }

  void getTaskByTab(int index, {SortedBy sort = SortedBy.date}) {
    state = state.copyWith(tabIndex: index);
    switch (index) {
      case 0:
        getTasks(sort: sort);
      case 1:
        getTaskByStatus(status: Status.inProgress, sort: sort);
      case 2:
        getTaskByStatus(status: Status.completed, sort: sort);
    }
  }

  Future<void> markAsInProgress({required int id}) async {
    try {
      await taskRepository.markAsInProgress(id: id);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> updateTask({
    required String title,
    String? content,
  }) async {
    try {
      final task = state.task;
      if (task == null) return;
      final id = task.id;
      final taskDto = TaskDto(
        title: title,
        content: content ?? state.task?.content,
        date: state.task?.date ?? DateTime.now().toUtc(),
        status: state.task?.status ?? Status.inProgress,
      );
      await taskRepository.update(id: id, taskDto: taskDto);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> deleteTask() async {
    try {
      final task = state.task;
      if (task == null) return;
      await taskRepository.delete(id: task.id);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
    } catch (e) {
      debugPrint('$e');
    }
  }

  void onFilterChange(SortedBy sort) {
    state = state.copyWith(sortedBy: sort);
    getTaskByTab(state.tabIndex, sort: sort);
  }
}
