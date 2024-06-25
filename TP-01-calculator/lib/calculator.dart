import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _result = 0;
  int _counter = 0;
  int _increment = 2;
  String _calcul = 'add';

  void _addCounter() {
    setState(() {
      _counter += _increment;
      _process();
    });
  }

  void _process() {
    if (_increment == 0) {
      _showAlertDialog();
      return;
    }
    switch (_calcul) {
      case 'add':
        _incrementCounter();
        break;
      case 'substract':
        _substractCounter();
        break;
      case 'multiply':
        _multiplyCounter();
        break;
      case 'divide':
        divideCounter();
        break;
    }
  }

  void setCalcul(String value) {
    setState(() {
      _calcul = value;
    });
  }

  void _incrementCounter() {
    setState(() {
      _result = _counter + _increment;
    });
  }

  void _substractCounter() {
    setState(() {
      _result = _counter - _increment;
    });
  }

  void _multiplyCounter() {
    setState(() {
      _result = _counter * _increment;
    });
  }

  void divideCounter() {
    setState(() {
      _result = _counter ~/ _increment;
    });
  }

  num _numberOfClicks() {
    return _counter ~/ _increment;
  }

  String _displayOperator(String calcul) {
    switch (calcul) {
      case 'add':
        return '+';
      case 'substract':
        return '-';
      case 'multiply':
        return '*';
      case 'divide':
        return '/';
      default:
        return '+';
    }
  }

  String _displayStringOperator(String calcul) {
    return calcul.characters.first.toUpperCase() + calcul.substring(1);
  }

  void _showAlertDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Erreur'),
          content: const Text('L\'increment ne peut pas être 0.'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  _increment = 1;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
        backgroundColor: CupertinoColors.systemIndigo,
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_counter > 0)
                  Text(
                    'Vous avez cliqué ${_numberOfClicks()} fois',
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_counter ${_displayOperator(_calcul)} $_increment = ',
                    ),
                    Text(
                      '$_result',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(
                            color: CupertinoColors.systemIndigo,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: CupertinoTextField(
                      placeholder: 'Entrez un nombre',
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.isEmpty || value == '0') {
                          return _showAlertDialog();
                        } else {
                          setState(() {
                            _increment = int.tryParse(value) ?? 1;
                          });
                        }
                      },
                      padding: const EdgeInsets.all(10),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: CupertinoPicker(
                      itemExtent: 32.0,
                      onSelectedItemChanged: (int index) {
                        setCalcul(
                            ['add', 'substract', 'multiply', 'divide'][index]);
                        _process();
                      },
                      children: const [
                        Text('add'),
                        Text('multiply'),
                        Text('substract'),
                        Text('divide'),
                      ],
                    )),
              ],
            ),
          ),
          Positioned(
            top: 35,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _displayStringOperator(_calcul),
                textAlign: TextAlign.center,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navLargeTitleTextStyle
                    .copyWith(
                      color: CupertinoColors.systemIndigo,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoButton(
                onPressed: _addCounter,
                borderRadius: BorderRadius.circular(25),
                color: CupertinoColors.systemIndigo,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '+ $_increment',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navActionTextStyle
                      .copyWith(
                        color: CupertinoColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
