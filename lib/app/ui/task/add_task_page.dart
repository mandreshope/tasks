import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/ui/states/task_view_model.dart';
import 'package:tasks/app/ui/widgets/widgets.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<AddTaskPage> {
  late TextEditingController titleCntrl;
  late TextEditingController contentCntrl;

  @override
  void initState() {
    super.initState();
    titleCntrl = TextEditingController();
    contentCntrl = TextEditingController();
  }

  @override
  void dispose() {
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
                if (titleCntrl.text.isEmpty) {
                  Snackbar.error(
                    context: context,
                    title: 'The title is required',
                  );
                  return;
                }
                await ref.read(taskViewModelProvider.notifier).addTask(
                      title: titleCntrl.text,
                      content: contentCntrl.text,
                    );

                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  Snackbar.success(
                    context: context,
                    title: 'The task is added',
                  );
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
