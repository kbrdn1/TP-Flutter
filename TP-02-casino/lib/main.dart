import 'package:flutter/cupertino.dart';
import 'bandit_manchot/index.dart';

void main() {
  runApp(const Casino());
}

class Casino extends StatelessWidget {
  const Casino({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Casino',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemGreen,
      ),
      home: BanditManchot(title: 'Casino')
    );
  }
}
