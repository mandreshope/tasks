import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/ui/task/add_task_page.dart';
import 'package:tasks/app/ui/task/tasks_page.dart';

void main() {
  testWidgets('TasksPage widget test', (WidgetTester tester) async {
    /// Set up the testable widget within a ProviderScope for Riverpod state management.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: TasksPage(),
        ),
      ),
    );

    /// Verify that the title "Tasks" is displayed in the AppBar.
    expect(find.text('Tasks'), findsOneWidget);

    /// Verify that the three tabs "All", "In progress", and "Completed" are present.
    expect(find.text('All'), findsOneWidget);
    expect(find.text('In progress'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);

    /// Interact with the "In progress" tab and verify it is selected.
    await tester.tap(find.text('In progress'));
    await tester.pumpAndSettle();
    expect(find.text('In progress'), findsOneWidget);

    /// Verify that the FloatingActionButton is present.
    expect(find.byType(FloatingActionButton), findsOneWidget);

    /// Interact with the FloatingActionButton and verify navigation to AddTaskPage.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AddTaskPage), findsOneWidget);
  });
}
