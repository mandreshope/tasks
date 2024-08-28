import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/ui/states/task_view_model.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';
import 'package:tasks/app/ui/task/detail_task_page.dart';
import 'package:tasks/app/ui/widgets/widgets.dart';

class TaskList extends ConsumerWidget {
  final Status? statusFilter;

  const TaskList({super.key, this.statusFilter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskViewModelProvider);
    return _buildWidget(state, ref, context);
  }

  Widget _buildTaskList(List<Task> tasks, WidgetRef ref) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskItem(
          title: task.title,
          isComleted: task.status.isCompleted,
          onTap: () => _onTaskTap(task, ref, context),
          toogleState: () {
            final id = task.id;
            if (id == null) return;
            if (task.status.isCompleted) {
              ref.read(taskViewModelProvider.notifier).markAsInProgress(id: id);
            } else {
              ref.read(taskViewModelProvider.notifier).markAsCompleted(id: id);
            }
          },
        );
      },
    );
  }

  Widget _buildWidget(
    TaskViewState state,
    WidgetRef ref,
    BuildContext context,
  ) {
    switch (state.status) {
      case TaskViewStatus.loading:
        return const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      case TaskViewStatus.init:
        return const Center(child: Text('No task'));
      case TaskViewStatus.success:
        return _buildTaskList(state.tasks, ref);
      case TaskViewStatus.error:
        return const Center(child: Text('Error'));
      case TaskViewStatus.empty:
        return const Center(child: Text('No task'));
    }
  }

  void _onTaskTap(Task task, WidgetRef ref, BuildContext context) {
    ref.read(taskViewModelProvider.notifier).taskSelected(task: task);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DetailTaskPage()));
  }
}

// Usage for All Tasks
class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskList();
  }
}

// Usage for Completed Tasks
class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskList(statusFilter: Status.completed);
  }
}

// Usage for in progress Tasks
class InProgressTasks extends StatelessWidget {
  const InProgressTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskList(statusFilter: Status.inProgress);
  }
}
