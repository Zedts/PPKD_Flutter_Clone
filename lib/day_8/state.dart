import 'package:flutter/material.dart';

class StateFul extends StatefulWidget {
  const StateFul({super.key});

  @override
  State<StateFul> createState() => _StateFullState();
}

class _StateFullState extends State<StateFul> {
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            showImage = !showImage;
          },
          child: const Text('Show/Hide Image'),
        ),
        if (showImage)
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            height: 200,
            width: 200,
          ),
      ],
    );
  }
}