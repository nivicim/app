import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GerarQrcode extends StatefulWidget {
  const GerarQrcode({super.key});

  @override
  State<GerarQrcode> createState() => _GerarQRCodeState();
}

class _GerarQRCodeState extends State<GerarQrcode> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gerador de QRCode"),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(textController.text.isNotEmpty)
                QrImageView(data: textController.text,size: 200,),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Adicione as informações a serem utilizadas',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      labelText: 'Adicione as informações a serem utilizadas'
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){}, child: const Text("Gerar QR Code"))
            ],
          ),
        ),
      ),
    );
  }
}