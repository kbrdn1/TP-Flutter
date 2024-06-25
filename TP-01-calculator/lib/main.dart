import 'package:flutter/cupertino.dart';
import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Calculator',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemPurple,
      ),
      home: Calculator(title: 'Calculator'),
    );
  }
}
