// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_navigation_template/ui/pages/page1.dart';
import 'package:f_navigation_template/ui/pages/page2.dart';
import 'package:f_navigation_template/ui/pages/page3a.dart';
import 'package:f_navigation_template/ui/pages/page3b.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  Widget buildPage3bWithNavigation({required String name}) {
    return GetMaterialApp(
      initialRoute: '/page3b/?name=$name',
      getPages: [
        GetPage(name: '/page3b', page: () => Page3B()),
      ],
    );
  }

  Widget buildPage3aWithNavigation({required String name}) {
    return GetMaterialApp(
      initialRoute: '/page3a/?name=$name',
      getPages: [
        GetPage(name: '/page3a', page: () => const Page3A()),
      ],
    );
  }

  Widget buildPage1WithNavigation({required String name}) {
    return GetMaterialApp(
      initialRoute: '/page1',
      getPages: [
        GetPage(name: '/page1', page: () => const Page1()),
        GetPage(name: '/page2', page: () => Page2()),
      ],
    );
  }

  /// Test to verify that Page3B displays the correct AppBar title.
  testWidgets('Page3B displays correct app bar title',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();
    // Verify that an AppBar is present.
    final appBarFinder = find.byType(AppBar);
    expect(appBarFinder, findsOneWidget);
    // Verify that the AppBar title is correctly rendered.
    final titleFinder = find.text('$name Option B');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Page3B displays snackbar when top button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';

    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();

    final buttonFinder = find.text('Show Top Snackbar');
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    final snackbarFinder = find.text('This is a snackbar on Top');
    expect(snackbarFinder, findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Page3B displays snackbar when bottom button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();

    final buttonFinder = find.text('Show Bottom Snackbar');
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    final snackbarFinder = find.text('This is a snackbar on Bottom');
    expect(snackbarFinder, findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Page3B displays snackbar when top button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();

    final buttonFinder = find.text('Show Top Snackbar');
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    final snackbarFinder = find.text('This is a snackbar on Top');
    expect(snackbarFinder, findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Page3B displays snackbar when bottom button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Show Bottom Snackbar'));
    await tester.pump();
    expect(find.byType(GetSnackBar), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));

    await tester.tap(find.text('Show Top Snackbar'));
    await tester.pump();
    expect(find.byType(GetSnackBar), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Page3A displays correct app bar title',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3aWithNavigation(name: name));
    await tester.pumpAndSettle();
    final appBarFinder = find.byKey(const Key('appBar'));
    expect(appBarFinder, findsOneWidget);

    final titleFinder = find.text('$name Option A');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Page3A updates current selection when candy tile is tapped',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3aWithNavigation(name: name));
    final initialSelectionFinder = find.byKey(const Key('currentSelection'));
    expect(initialSelectionFinder, findsOneWidget);
    expect(initialSelectionFinder, findsOneWidget);

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

  testWidgets('Page1 form validation and navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildPage1WithNavigation(name: 'name'));

    // Ensure the initial state is correct
    expect(
        find.text(
            'Please enter your name and press the button below to continue.'),
        findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);

    // Attempt to submit the form without entering a name
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Ensure the form validation error message is displayed
    expect(find.text('Please enter some text'), findsOneWidget);

    // Enter a name in the text field
    await tester.enterText(find.byType(TextFormField), 'John');
    await tester.pump();

    // Submit the form
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(
        find.text(
            'Please enter your name and press the button below to continue.'),
        findsNothing);
  });
}
