import 'package:f_navigation_template/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Basic integration test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // ensure we are on page1
    expect(
        find.text(
            'Please enter your name and press the button below to continue.'),
        findsOneWidget);

    // Enter a name in the text field
    await tester.enterText(find.byType(TextFormField), 'John');
    await tester.pump();

    // Submit the form
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // ensure we are on page2
    expect(find.text('You have successfully navigated to this page.'),
        findsOneWidget);

    await tester.tap(find.text('Option A'));
    await tester.pumpAndSettle();

    // ensure we are on page3a
    final titleFinder = find.text('John Option A');
    expect(titleFinder, findsOneWidget);

    final buttonFinder = find.byKey(const Key('elevatedButton'));
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    final likeCandyTileFinder = find.byKey(const Key('likeCandyTile'));
    expect(likeCandyTileFinder, findsOneWidget);
    await tester.tap(likeCandyTileFinder);
    await tester.pumpAndSettle();

    final updatedSelectionFinder = find.text('Give me candy');
    expect(updatedSelectionFinder, findsOneWidget);
  });
}
