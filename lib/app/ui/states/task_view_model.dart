import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

final taskViewModelProvider =
    StateNotifierProvider.autoDispose<TaskViewModel, TaskViewState>((ref) {
  return TaskViewModel(ref: ref);
});

class TaskViewModel extends StateNotifier<TaskViewState> {
  TaskViewModel({required this.ref}) : super(const TaskViewState.status()) {}
  final StateNotifierProviderRef<TaskViewModel, TaskViewState> ref;

  void initData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getTasks();
    });
  }

  Future<void> getTasks() async {
    try {} catch (e) {
      debugPrint('$e');
    }
  }
}
