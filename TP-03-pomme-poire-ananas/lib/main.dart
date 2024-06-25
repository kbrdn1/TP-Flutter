import 'package:flutter/cupertino.dart';
import 'fruits/index.dart';

void main() {
  runApp(const PommePoireAnanas());
}

class PommePoireAnanas extends StatelessWidget {
  const PommePoireAnanas({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemPurple,
      ),
      home: Game(title: 'Pomme, poire, ananas'),
    );
  }
}
