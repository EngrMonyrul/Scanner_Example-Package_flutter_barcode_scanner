import 'package:flutter/material.dart';

class ScanResultScreen extends StatelessWidget {
  final String result;

  ScanResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Result'),
      ),
      body: Center(
        child: Text(
          'Scan Result: $result',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
