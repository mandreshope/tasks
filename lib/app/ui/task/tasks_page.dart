import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/ui/states/task_view_model.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';
import 'package:tasks/app/ui/task/add_task_page.dart';
import 'package:tasks/app/ui/widgets/widgets.dart';

class TasksPage extends ConsumerStatefulWidget {
  const TasksPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage>
    with TickerProviderStateMixin {
  late TabController tabCntrl;
  @override
  void initState() {
    super.initState();
    tabCntrl = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskViewModelProvider.notifier).getTasks();
    });

    tabCntrl.addListener(_onTabChange);
  }

  void _onTabChange() {
    ref.read(taskViewModelProvider.notifier).getTaskByTab(
          tabCntrl.index,
          sort: ref.read(taskViewModelProvider).sortedBy,
        );
  }

  @override
  void dispose() {
    tabCntrl.dispose();
    tabCntrl.removeListener(_onTabChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            enableFeedback: true,
            controller: tabCntrl,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'In progress'),
              Tab(text: 'Completed'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabCntrl,
              children: const [
                AllTasks(),
                InProgressTasks(),
                CompletedTasks(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => const AddTaskPage()));
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  barrierColor: Colors.black26,
                  builder: (BuildContext context) {
                    return Consumer(
                      builder: (context, ref, w) {
                        final sortedBy = ref.watch(
                          taskViewModelProvider.select((v) => v.sortedBy),
                        );
                        return Container(
                          height: 200,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                'Sort by',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ListTile(
                                leading: sortedBy.isDate
                                    ? const Icon(Icons.check)
                                    : const Icon(
                                        Icons.close,
                                        color: Colors.transparent,
                                      ),
                                title: const Text('Date'),
                                onTap: () {
                                  ref
                                      .read(taskViewModelProvider.notifier)
                                      .onFilterChange(SortedBy.date);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: sortedBy.isName
                                    ? const Icon(Icons.check)
                                    : const Icon(
                                        Icons.close,
                                        color: Colors.transparent,
                                      ),
                                title: const Text('Name'),
                                onTap: () {
                                  ref
                                      .read(taskViewModelProvider.notifier)
                                      .onFilterChange(SortedBy.name);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              icon: const Icon(Icons.sort),
            ),
          ],
        ),
      ),
    );
  }
}
