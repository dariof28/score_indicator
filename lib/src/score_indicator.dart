import 'package:flutter/material.dart';

import 'dot_indicator.dart';

/// Draw an indicator with as many [score] dot over [count] dot.
class ScoreIndicator extends StatelessWidget {
  /// A label to describe what the indicator is to.
  final Text label;

  /// The total count of dots.
  final int count;

  /// Defines how many elements should be of [filledIndicatorColor].
  final int score;

  /// Defines each indicator radius.
  final double radius;

  /// The color of the score dots.
  final Color filledIndicatorColor;

  /// The color of the empty dots.
  final Color emptyIndicatorColor;

  ScoreIndicator({
    Key? key,
    required this.label,
    required this.count,
    required this.score,
    this.radius = 4.0,
    required this.filledIndicatorColor,
    this.emptyIndicatorColor = Colors.grey,
  })  : assert(count > 0),
        assert(score >= 0 && score <= count),
        assert(radius > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: _drawCircleItem()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: label,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawCircleItem() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.0,
      children: <Widget>[
        ...List<Widget>.generate(
          score,
          (_) => DotIndicator(
            radius: radius,
            color: filledIndicatorColor,
          ),
        ),
        ...List<Widget>.generate(
          count - score,
          (_) => DotIndicator(
            radius: radius,
            color: emptyIndicatorColor,
          ),
        ),
      ],
    );
  }
}
