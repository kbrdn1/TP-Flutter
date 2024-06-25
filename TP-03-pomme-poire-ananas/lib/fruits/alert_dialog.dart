import 'package:flutter/cupertino.dart';

class AlertDialog extends StatelessWidget {
  const AlertDialog({
    required this.item,
    required this.isPrime,
    required this.onDelete,
  });

  final int item;
  final bool isPrime;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        isPrime
            ? "$item : Nombre premier"
            : item % 2 == 0
                ? "$item : Nombre pair"
                : "$item : Nombre impair",
      ),
      content: Image.asset(
        isPrime
            ? 'assets/ananas.png'
            : item % 2 == 0
                ? 'assets/poire.png'
                : 'assets/pomme.png',
        width: 50,
        height: 50,
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onDelete,
          child: const Text('Supprimer'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}