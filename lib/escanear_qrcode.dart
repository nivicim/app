import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class EscanearQRCode extends StatefulWidget {
  const EscanearQRCode({super.key});

  @override
  State<EscanearQRCode> createState() => _GerarQRCodeState();
}

class _GerarQRCodeState extends State<EscanearQRCode> {
  String resultadoQrCode = 'Dados do QR Code aparecerão aqui';
  
  get onPressed => null;
  
  Future<void> scanQR()async{
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        resultadoQrCode = qrCode.toString();
      });
    } on PlatformException{
      resultadoQrCode = 'Falha ao ler o QR Code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Escanear QR Code"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Text(resultadoQrCode, style: const TextStyle(color: Colors.black),),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQR, child: const Text("Escanear QR Code"))
          ],
        ),
      ),
    );
  }
}