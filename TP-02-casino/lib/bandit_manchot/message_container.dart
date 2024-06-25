import 'package:flutter/cupertino.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}