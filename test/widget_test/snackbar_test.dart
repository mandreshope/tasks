import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/app/ui/widgets/widgets.dart';

void main() {
  group('Snackbar Widget Tests', () {
    testWidgets('displays success snackbar', (WidgetTester tester) async {
      // Arrange
      const testKey = Key('snackbar_test');
      const String message = 'Success message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                key: testKey,
                onPressed: () => Snackbar.success(
                  context: context,
                  title: message,
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(testKey));
      await tester.pump(); // Start animation
      await tester.pump(const Duration(seconds: 1)); // Finish animation

      // Assert
      expect(find.text(message), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        tester.widget<SnackBar>(find.byType(SnackBar)).backgroundColor,
        Colors.green,
      );
    });

    testWidgets('displays error snackbar', (WidgetTester tester) async {
      // Arrange
      const testKey = Key('snackbar_test');
      const String message = 'Error message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                key: testKey,
                onPressed: () => Snackbar.error(
                  context: context,
                  title: message,
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(testKey));
      await tester.pump(); // Start animation
      await tester.pump(const Duration(seconds: 1)); // Finish animation

      // Assert
      expect(find.text(message), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        tester.widget<SnackBar>(find.byType(SnackBar)).backgroundColor,
        Colors.red,
      );
    });
  });
}
