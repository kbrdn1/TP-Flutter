import 'package:flutter/cupertino.dart';

class AppBar extends StatelessWidget {
  const AppBar({
    required this.title,
    required this.counter,
    required this.isPrime,
  });

  final String title;
  final int counter;
  final bool isPrime;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(
        '$title - $counter : ${isPrime ? "Nombre premier" : counter % 2 == 0 ? "Nombre pair" : "Nombre impair"}',
      ),
    );
  }
}