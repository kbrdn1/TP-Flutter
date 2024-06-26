import 'package:flutter/cupertino.dart';
import 'screens/albums_master.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemPurple,
      ),
      home: AlbumsMaster(),
    );
  }
}
