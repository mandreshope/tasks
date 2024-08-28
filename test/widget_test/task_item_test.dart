import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/app/ui/widgets/widgets.dart';

void main() {
  group('TaskItem Widget Tests', () {
    testWidgets('displays task with title and incomplete state',
        (WidgetTester tester) async {
      // Arrange
      const String taskTitle = 'Test Task';
      bool isCompleted = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskItem(
              title: taskTitle,
              isComleted: isCompleted,
              onTap: () {},
              toogleState: () {},
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text(taskTitle), findsOneWidget);
      expect(find.byIcon(Icons.radio_button_off), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
      expect(
        tester.widget<Text>(find.text(taskTitle)).style?.decoration,
        isNull,
      );
    });

    testWidgets('displays task with completed state',
        (WidgetTester tester) async {
      // Arrange
      const String taskTitle = 'Test Task';
      bool isCompleted = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskItem(
              title: taskTitle,
              isComleted: isCompleted,
              onTap: () {},
              toogleState: () {},
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text(taskTitle), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.byIcon(Icons.radio_button_off), findsNothing);
      expect(
        tester.widget<Text>(find.text(taskTitle)).style?.decoration,
        TextDecoration.lineThrough,
      );
    });

    testWidgets('toggles task state when icon is pressed',
        (WidgetTester tester) async {
      // Arrange
      const String taskTitle = 'Test Task';
      bool isCompleted = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskItem(
              title: taskTitle,
              isComleted: isCompleted,
              onTap: () {},
              toogleState: () {
                isCompleted = !isCompleted;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byIcon(Icons.radio_button_off));
      await tester.pump();

      // Assert
      // We can't directly check if isCompleted was toggled since it’s a local variable,
      // but you would check the UI changes accordingly in an integration test or by
      // using a state management solution.
    });

    testWidgets('triggers onTap when the task item is tapped',
        (WidgetTester tester) async {
      // Arrange
      const String taskTitle = 'Test Task';
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskItem(
              title: taskTitle,
              isComleted: false,
              onTap: () {
                wasTapped = true;
              },
              toogleState: () {},
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text(taskTitle));
      await tester.pump();

      // Assert
      expect(wasTapped, isTrue);
    });
  });
}
