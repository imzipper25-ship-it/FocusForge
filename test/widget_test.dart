import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusforge/main.dart';

void main() {
  testWidgets('App starts successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FocusForgeApp());

    // Verify that splash screen is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
