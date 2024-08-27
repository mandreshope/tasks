import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              await ref.read(taskViewModelProvider.notifier).deleteTask();
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                Navigator.of(context).pop();
              });
            },
            icon: const Icon(Icons.delete),
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
                final task = ref.read(taskViewModelProvider).task;
                if (task == null) return;
                await ref
                    .read(taskViewModelProvider.notifier)
                    .markAsCompleted(id: task.id);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Snackbar.success(
                    context: context,
                    title: 'The task is completed',
                  );
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Mark as completed'),
            ),
          ],
        ),
      ),
    );
  }
}
