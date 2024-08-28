import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/data/providers/task_provider.dart';
import 'package:tasks/app/data/repositories/repositories.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

/// The provider for the TaskViewModel, using Riverpod's StateNotifierProvider
/// with autoDispose to manage the lifecycle of the view model.
final taskViewModelProvider =
    StateNotifierProvider.autoDispose<TaskViewModel, TaskViewState>((ref) {
  return TaskViewModel(ref: ref);
});

/// TaskViewModel manages the state of tasks in the application.
/// It interacts with the TaskRepository to fetch, update, and delete tasks.
class TaskViewModel extends StateNotifier<TaskViewState> {
  /// Constructor initializes the TaskRepository using the provider reference.
  TaskViewModel({required this.ref}) : super(const TaskViewState()) {
    taskRepository = ref.read(taskRepositoryProvider);
  }

  /// Reference to the provider, required to read other providers.
  final StateNotifierProviderRef<TaskViewModel, TaskViewState> ref;

  /// The repository that handles data operations for tasks.
  late TaskRepository taskRepository;

  /// Fetches all tasks, optionally sorted by the provided [sort] criteria.
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

  /// Fetches tasks filtered by their [status], optionally sorted by [sort].
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

  /// Sets the selected task in the state.
  void taskSelected({required Task task}) => state = state.copyWith(task: task);

  /// Fetches a task by its [id].
  Future<void> getTaskById({required int id}) async {
    try {
      state = state.copyWith(status: TaskViewStatus.loading);
      final task = await taskRepository.getTaskById(id: id);
      state = state.copyWith(status: TaskViewStatus.success, task: task);
    } catch (e) {
      state = state.copyWith(status: TaskViewStatus.error);
      debugPrint('$e');
    }
  }

  /// Adds a new task with the given [title] and optional [content].
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

  /// Restores a deleted task.
  Future<void> restoreTask({required Task task}) async {
    try {
      final taskDto = TaskDto(
        id: task.id,
        title: task.title,
        content: task.content,
        date: task.date,
        status: task.status,
      );
      await taskRepository.add(task: taskDto);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
    } catch (e) {
      debugPrint('$e');
    }
  }

  /// Marks a task as completed by its [id].
  Future<void> markAsCompleted({required int id}) async {
    try {
      final tasks = await taskRepository.markAsCompleted(id: id);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
      debugPrint('$tasks');
    } catch (e) {
      debugPrint('$e');
    }
  }

  /// Fetches tasks based on the currently selected tab [index].
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

  /// Marks a task as in progress by its [id].
  Future<void> markAsInProgress({required int id}) async {
    try {
      await taskRepository.markAsInProgress(id: id);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
    } catch (e) {
      debugPrint('$e');
    }
  }

  /// Updates the current task with a new [title] and optional [content].
  Future<void> updateTask({
    required String title,
    String? content,
  }) async {
    try {
      final task = state.task;
      final id = task?.id;
      if (id == null) return;
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

  /// Deletes a task by its [id].
  Future<void> deleteTask({required int id}) async {
    try {
      await taskRepository.delete(id: id);
      getTaskByTab(state.tabIndex, sort: state.sortedBy);
    } catch (e) {
      debugPrint('$e');
    }
  }

  /// Updates the current sort filter and refreshes the task list.
  void onFilterChange(SortedBy sort) {
    state = state.copyWith(sortedBy: sort);
    getTaskByTab(state.tabIndex, sort: sort);
  }
}
