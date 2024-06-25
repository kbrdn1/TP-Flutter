import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'display_container.dart';
import 'message_container.dart';

class BanditManchot extends StatefulWidget {
  const BanditManchot({super.key, required this.title});

  final String title;

  @override
  State<BanditManchot> createState() => _BanditManchotState();
}

class _BanditManchotState extends State<BanditManchot> {
  final List<String> _iconList = [
    '🧲',
    '💎',
    '🍒',
    '7️⃣',
    '🧩',
    '🎁',
    '👾'
  ];
  List<String> _selectedIcons = [];
  String _message = '';
  bool _isJackpot = false;

  void _selectRandomIcons() {
    setState(() {
      _selectedIcons.clear();
      for (int i = 0; i < 3; i++) {
        _selectedIcons.add(_iconList[_randomize()]);
      }
      _checkResult();
    });
  }

  void _checkResult() {
    if (_selectedIcons[0] == _selectedIcons[1] && _selectedIcons[1] == _selectedIcons[2]) {
      _isJackpot = true;
      if (_selectedIcons[0] == '7️⃣') {
        _message = 'Jackpot with 7️⃣!';
      } else {
        _message = 'Jackpot!';
      }
    } else {
      _isJackpot = false;
      _message = 'You lost, try again!';
    }
  }

  int _randomize() {
    int random = Random().nextInt(_iconList.length);
    return random;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Container(
        color: _isJackpot ? const Color(0xFFFFA726) : CupertinoColors.systemBackground,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DisplayContainer(selectedIcons: _selectedIcons),
                  const SizedBox(height: 20),
                  MessageContainer(message: _message),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: CupertinoButton.filled(
                  child: const Icon(CupertinoIcons.repeat, size: 50, color: CupertinoColors.white),
                  onPressed: () {
                    _selectRandomIcons();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}