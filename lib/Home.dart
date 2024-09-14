import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';


class QRBarcodeHome extends StatefulWidget {
  @override
  _QRBarcodeHomeState createState() => _QRBarcodeHomeState();
}

class _QRBarcodeHomeState extends State<QRBarcodeHome> {
  TextEditingController qrController = TextEditingController();
  TextEditingController barcodeController = TextEditingController();

  String qrData = "";
  String barcodeData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR and Barcode Generator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'QR Code:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              TextField(
                controller: qrController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter QR Code Data',
                ),
                onChanged: (value) {
                  setState(() {
                    qrData = value;
                  });
                },
              ),
              SizedBox(height: 20),
              QrImageView(
                data:qrData ,
                version: QrVersions.auto,
                size: 200,

              ),
              SizedBox(height: 10),
              Text(
                qrData,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 40),

              // Barcode Section
              Text(
                'Barcode:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              TextField(
                controller: barcodeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Barcode Data',
                ),
                onChanged: (value) {
                  setState(() {
                    barcodeData = value;
                  });
                },
              ),
              SizedBox(height: 20),

              BarcodeWidget(
                barcode: Barcode.code128(),
                data: barcodeData,
                width: 300,
                height: 100,
                drawText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
