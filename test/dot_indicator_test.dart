import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:score_indicator/src/dot_indicator.dart';

void main() {
  testWidgets('Dot indicator is of the provided color',
      (WidgetTester tester) async {
    final widget = DotIndicator(
      radius: 4.0,
      color: Colors.red,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );

    final decoration = BoxDecoration(color: Colors.red, shape: BoxShape.circle);
    WidgetPredicate predicate = (Widget widget) =>
        widget is Container && widget.decoration == decoration;

    expect(find.byWidgetPredicate(predicate), findsOneWidget);
  });

  testWidgets('Dot indicator has the given radius',
      (WidgetTester tester) async {
    final widget = DotIndicator(
      radius: 4.0,
      color: Colors.red,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );

    final constraints = BoxConstraints.tightFor(width: 4.0, height: 4.0);
    WidgetPredicate predicate = (Widget widget) =>
        widget is Container && widget.constraints == constraints;

    expect(find.byWidgetPredicate(predicate), findsOneWidget);
  });
}
