import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../kh_qr_payment.dart';

class KHQRGenerator extends StatelessWidget {
  final KHQRModel khqrModel;
  final double size;

  const KHQRGenerator({
    required this.khqrModel,
    this.size = 200.0, // Default QR code size
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Encrypt KHQR data before generating QR
    String encryptedData = KHQREncryptor.encrypt(khqrModel.encode());

    return QrImageView(
      data: encryptedData,
      version: QrVersions.auto,
      size: size,
      gapless: false,
      embeddedImage:
          const AssetImage('assets/logo.png'), // Optional: Add your logo
      embeddedImageStyle: const QrEmbeddedImageStyle(size: Size(40, 40)),
    );
  }
}
