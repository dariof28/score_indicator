import 'package:flutter/material.dart';
import 'package:score_indicator/score_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ScoreIndicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter ScoreIndicator Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color? _filledColor = Colors.blue;
  Color? _emptyColor = Colors.grey;
  int count = 5, score = 1;
  double radius = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Filled color'),
            DropdownButton<Color>(
              isExpanded: true,
              value: _filledColor,
              items: _colors,
              onChanged: (color) {
                setState(() {
                  _filledColor = color;
                });
              },
            ),
            Text('Empty color'),
            DropdownButton<Color>(
              isExpanded: true,
              value: _emptyColor,
              items: _colors,
              onChanged: (color) {
                setState(() {
                  _emptyColor = color;
                });
              },
            ),
            Text('Score'),
            Slider(
              min: 0,
              max: count.toDouble(),
              value: score.toDouble(),
              onChanged: (value) {
                setState(() {
                  score = value.toInt();
                });
              },
            ),
            Text('Total'),
            Slider(
              min: 1,
              max: 5,
              value: count.toDouble(),
              onChanged: (value) {
                setState(() {
                  if (value < score) {
                    score = value.toInt();
                  }
                  count = value.toInt();
                });
              },
            ),
            Text('Radius'),
            Slider(
              min: 2,
              max: 8,
              value: radius,
              onChanged: (value) {
                setState(() {
                  radius = value;
                });
              },
            ),
            ScoreIndicator(
              label: Text(
                'This is the label that describe what this indicator is to',
              ),
              count: count,
              score: score,
              radius: radius.toDouble(),
              emptyIndicatorColor: _emptyColor!,
              filledIndicatorColor: _filledColor!,
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<Color>> get _colors {
    Map<String, Color> colors = {
      'Blue': Colors.blue,
      'Red': Colors.red,
      'Orange': Colors.orange,
      'Green': Colors.green,
      'Grey': Colors.grey,
    };

    List<DropdownMenuItem<Color>> _list = [];

    colors.forEach((key, value) {
      _list.add(
        DropdownMenuItem(child: Text(key), value: value),
      );
    });

    return _list;
  }
}
