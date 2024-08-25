import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasks/app/data/models/task.dart';

part 'task_view_state.freezed.dart';

@freezed
class TaskViewState with _$TaskViewState {
  const factory TaskViewState.status({
    @Default(TaskViewStatus.init) TaskViewStatus status,
  }) = TaskStatus;
  const factory TaskViewState.tasks({@Default(<Task>[]) List<Task> tasks}) =
      Tasks;
}

enum TaskViewStatus {
  init,
  loading,
  success,
  error,
}
