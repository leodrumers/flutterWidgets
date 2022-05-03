import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input and Forms'),
      ),
      body: const Center(
        child: Text('InputScreen'),
      ),
    );
  }
}
