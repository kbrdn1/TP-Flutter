import 'package:flutter/cupertino.dart';
import 'alert_dialog.dart';
import 'app_bar.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.title});

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int _counter = 0;
  final List<int> _fruits = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _fruits.add(_counter);
    });
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void _showDialog(int item) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          item: item,
          isPrime: _isPrime(item),
          onDelete: () {
            setState(() {
              _fruits.remove(item);
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
  
  String _getCounterText() {
    if (_isPrime(_counter)) {
      return "Nombre premier";
    } else if (_counter % 2 == 0) {
      return "Nombre pair";
    } else {
      return "Nombre impair";
    }
  }

  Color _getItemColor(int item) {
    return item % 2 == 0
        ? CupertinoColors.systemIndigo
        : CupertinoColors.systemTeal;
  }

  String _getItemImage(int item) {
    if (_isPrime(item)) {
      return 'assets/ananas.png';
    } else if (item % 2 == 0) {
      return 'assets/poire.png';
    } else {
      return 'assets/pomme.png';
    }
  }

  Color _getButtonColor() {
    if (_counter == 0) {
      return CupertinoColors.systemOrange;
    } else if (_counter % 2 == 0) {
      return CupertinoColors.systemIndigo;
    } else {
      return CupertinoColors.systemTeal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '${widget.title} - $_counter : ${_getCounterText()}',
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: CupertinoColors.systemBackground,
            child: ListView.builder(
              itemCount: _fruits.length,
              itemBuilder: (context, index) {
                final item = _fruits[index];
                return GestureDetector(
                  onTap: () => _showDialog(item),
                  child: Container(
                    color: _getItemColor(item),
                    child: Row(
                      children: [
                        Image.asset(
                          _getItemImage(item),
                          width: 50,
                          height: 50,
                        ),
                        Expanded(
                          child: Text(
                            '$item',
                            style:
                                const TextStyle(color: CupertinoColors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: CupertinoButton(
              color: _getButtonColor(),
              onPressed: _incrementCounter,
              child: const Icon(CupertinoIcons.add),
            ),
          ),
        ],
      ),
    );
  }
}
