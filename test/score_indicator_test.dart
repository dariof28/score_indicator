import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:score_indicator/score_indicator.dart';
import 'package:score_indicator/src/dot_indicator.dart';

void main() {
  testWidgets('Count must be gt 0', (WidgetTester tester) async {
    expect(
      () => ScoreIndicator(
        label: Text('Strength'),
        count: 0,
        score: 2,
        filledIndicatorColor: Colors.red,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('Score must be gt or equal to 0', (WidgetTester tester) async {
    expect(
      () => ScoreIndicator(
        label: Text('Strength'),
        count: 3,
        score: -1,
        filledIndicatorColor: Colors.red,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('Score cannot be gt count', (WidgetTester tester) async {
    expect(
      () => ScoreIndicator(
        label: Text('Strength'),
        count: 3,
        score: 5,
        filledIndicatorColor: Colors.red,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('Radius must be gt 0', (WidgetTester tester) async {
    expect(
      () => ScoreIndicator(
        label: Text('Strength'),
        count: 5,
        score: 3,
        radius: 0,
        filledIndicatorColor: Colors.red,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('Radius is 4 by default if not provided',
      (WidgetTester tester) async {
    final widget = ScoreIndicator(
      label: Text('Strength'),
      count: 5,
      score: 2,
      filledIndicatorColor: Colors.red,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );

    WidgetPredicate predicate =
        (Widget widget) => widget is ScoreIndicator && widget.radius == 4.0;

    expect(find.byWidgetPredicate(predicate), findsOneWidget);
  });

  testWidgets('Empty indicator color is Colors.grey by default if not provided',
      (WidgetTester tester) async {
    final widget = ScoreIndicator(
      label: Text('Strength'),
      count: 5,
      score: 2,
      filledIndicatorColor: Colors.red,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );

    WidgetPredicate predicate = (Widget widget) =>
        widget is ScoreIndicator && widget.emptyIndicatorColor == Colors.grey;

    expect(find.byWidgetPredicate(predicate), findsOneWidget);
  });

  testWidgets('Display the given label', (WidgetTester tester) async {
    final label = Text('The Character Strength');
    final widget = ScoreIndicator(
      label: label,
      count: 5,
      score: 2,
      filledIndicatorColor: Colors.red,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );

    expect(find.text('The Character Strength'), findsOneWidget);
  });

  testWidgets(
      'Display correct number of dot with given configuration depending on score and count',
      (WidgetTester tester) async {
    final widget = ScoreIndicator(
      label: Text('Strength'),
      count: 5,
      score: 2,
      radius: 8.0,
      filledIndicatorColor: Colors.red,
      emptyIndicatorColor: Colors.yellow,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );

    WidgetPredicate predicateEmpty = (Widget widget) =>
        widget is DotIndicator &&
        widget.color == Colors.yellow &&
        widget.radius == 8.0;
    WidgetPredicate predicateFilled = (Widget widget) =>
        widget is DotIndicator &&
        widget.color == Colors.red &&
        widget.radius == 8.0;

    expect(find.byWidgetPredicate(predicateFilled), findsNWidgets(2));
    expect(find.byWidgetPredicate(predicateEmpty), findsNWidgets(3));
  });
}
