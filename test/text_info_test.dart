// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:api_example/components/text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(MaterialApp(
      home: TestAppWidget(
        body: child,
      ),
    ));
  }

  testWidgets('WHEN component textInfo THEN texto is equal to Widget',
      (WidgetTester tester) async {
    const texto = "teste";
    TextInfo input = const TextInfo(
      text: texto,
    );
    await loadPage(tester, input);
    await tester.pump();

    var findWidget = tester.widget<Text>(find.byType(Text));
    expect(findWidget.data, texto);
  });
}
