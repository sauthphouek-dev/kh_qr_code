import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../kh_qr_payment.dart';

class KHQRScanner extends StatelessWidget {
  final Function(KHQRModel) onScan;

  const KHQRScanner({required this.onScan, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        onDetect: (capture) {
          for (final barcode in capture.barcodes) {
            if (barcode.rawValue != null) {
              String decryptedData = KHQREncryptor.decrypt(barcode.rawValue!);
              onScan(KHQRModel.decode(decryptedData));
            }
          }
        },
      ),
    );
  }
}
