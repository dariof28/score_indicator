# score_indicator

Display a graphical indicator that displays a score/total with a label

## Features

```dart
ScoreIndicator(
  label: Text('Rating'),
  count: 5,
  score: 3,
  radius: 8.0,
  filledIndicatorColor: Colors.red,
  emptyIndicatorColor: Colors.blue,
);
```

Notes:
- If `radius` is not provided it defaults to **4.0**.
- If `emptyIndicatorColor` is not provided it defaults to `Colors.grey`.
- `score` must not be greater than `count` and should not be negative.
- `count` and `radius` must be greater than 0.