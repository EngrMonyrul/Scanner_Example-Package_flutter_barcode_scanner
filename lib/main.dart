import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'file.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _scanResult = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcode() async {
    String barcodeScanResult;
    try {
      barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.DEFAULT,
      );
      print(barcodeScanResult);
    } on PlatformException {
      barcodeScanResult = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanResult = barcodeScanResult;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanResultScreen(result: _scanResult),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Barcode & QR Code Scanner')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => scanBarcode(),
                child: Text('Start Barcode & QR Code Scan'),
              ),
              Text(
                'Scan result: $_scanResult\n',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
