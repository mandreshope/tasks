import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/ui/states/task_view_model.dart';
import 'package:tasks/app/ui/widgets/widgets.dart';

class DetailTaskPage extends ConsumerStatefulWidget {
  const DetailTaskPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends ConsumerState<DetailTaskPage> {
  late TextEditingController titleCntrl;
  late TextEditingController contentCntrl;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    final task = ref.read(taskViewModelProvider).task;
    if (task == null) {
      Navigator.of(context).pop();
    } else {
      titleCntrl = TextEditingController(text: task.title);
      contentCntrl = TextEditingController(text: task.content);
    }
  }

  void _onChangedDebounced(Function(String) onChanged, String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      onChanged(value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    titleCntrl.dispose();
    contentCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final task = ref.watch(taskViewModelProvider).task;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        title: const Text('Task'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final viewModel = ref.read(taskViewModelProvider.notifier);
              final id = task?.id;
              if (task == null || id == null) return;

              await viewModel.deleteTask(id: id);

              if (!mounted) return; // Ensure the widget is still mounted

              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Display the Snackbar and then pop the screen
                Snackbar.error(
                  context: context,
                  title: 'The task is deleted',
                  action: SnackBarAction(
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    label: 'Cancel',
                    onPressed: () => viewModel.restoreTask(task: task),
                  ),
                );
                Navigator.of(context).pop();
              });
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Title'),
                  ),
                  TextField(
                    controller: titleCntrl,
                    decoration: const InputDecoration(
                      hintText: 'Enter a title',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (titleCntrl.text.isEmpty) {
                        Snackbar.error(
                          context: context,
                          title: 'The title is required',
                        );
                        return;
                      }
                      _onChangedDebounced(
                        (val) {
                          ref
                              .read(taskViewModelProvider.notifier)
                              .updateTask(title: titleCntrl.text);
                        },
                        value,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Details'),
                  ),
                  TextField(
                    controller: contentCntrl,
                    decoration: const InputDecoration(
                      hintText: 'Add details',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    onChanged: (value) {
                      _onChangedDebounced(
                        (val) {
                          ref.read(taskViewModelProvider.notifier).updateTask(
                                content: contentCntrl.text,
                                title: titleCntrl.text,
                              );
                        },
                        value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () async {
                final id = task?.id;
                if (id == null || task == null) return;

                if (task.status.isCompleted) {
                  ref
                      .read(taskViewModelProvider.notifier)
                      .markAsInProgress(id: id);
                } else {
                  ref
                      .read(taskViewModelProvider.notifier)
                      .markAsCompleted(id: id);
                }

                if (!mounted) return; // Ensure the widget is still mounted

                Snackbar.success(
                  context: context,
                  title: task.status.isCompleted
                      ? 'The task is in progress'
                      : 'The task is completed',
                );
                Navigator.of(context).pop();
              },
              child: Text(
                task?.status.isCompleted == true
                    ? 'Mark as in progress'
                    : 'Mark as completed',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
