import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasks/app/data/models/task.dart';

part 'task_view_state.freezed.dart';

@freezed
class TaskViewState with _$TaskViewState {
  const factory TaskViewState({
    @Default(TaskViewStatus.init) TaskViewStatus status,
    @Default([]) List<Task> tasks,
    @Default(null) Task? task,
    @Default(0) int tabIndex,
    @Default(SortedBy.date) SortedBy sortedBy,
  }) = _TaskViewState;
}

enum SortedBy {
  date,
  name,
}

enum TaskViewStatus {
  init,
  loading,
  success,
  error,
  empty,
}

extension SortedByExt on SortedBy {
  bool get isDate => this == SortedBy.date;
  bool get isName => this == SortedBy.name;
}

extension TaskViewStatusExt on TaskViewStatus {
  bool get isLoading => this == TaskViewStatus.loading;
  bool get isSuccess => this == TaskViewStatus.success;
  bool get isError => this == TaskViewStatus.error;
  bool get isInit => this == TaskViewStatus.init;
  bool get isEmpty => this == TaskViewStatus.empty;
}
