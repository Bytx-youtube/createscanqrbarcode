import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();
  String barcodeData = "12345";
  String scanResult = " ";

  Future<void> scanQR() async {
    String result = "";

    try {
      result = await FlutterBarcodeScanner.scanBarcode("#0000ff", "Cancel", false, ScanMode.BARCODE,);
    } catch(e) {
      print("ERROR");
    }

    setState(() {
      scanResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if(controller.text.length >=5) {
                setState(() {
                  barcodeData = controller.text;
                });
              }
            },
            child: Container(
              height: 70,
              width: 200,
              color: Colors.orange,
              child: const Center(
                child: Text("Update QR Data"),
              ),
            ),
          ),
          BarcodeWidget(
            data: barcodeData,
            barcode: Barcode.qrCode(),
          ),
          TextFormField(
            controller: controller,
          ),
          SizedBox(height: 200,),
          GestureDetector(
            onTap: () {
              scanQR();
            },
            child: Container(
              height: 70,
              width: 200,
              color: Colors.orange,
              child: const Center(
                child: Text("SCAN QR"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
