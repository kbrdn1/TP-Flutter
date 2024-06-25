import 'package:flutter/cupertino.dart';

class DisplayContainer extends StatelessWidget {
  const DisplayContainer({required this.selectedIcons});

  final List<String> selectedIcons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: selectedIcons
          .map((String icon) => Text(
                icon,
                style: const TextStyle(fontSize: 50),
              ))
          .toList(),
    );
  }
}