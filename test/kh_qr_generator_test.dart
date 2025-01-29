import 'package:flutter_test/flutter_test.dart';
import 'package:kh_qr_payment/kh_qr_payment.dart';

void main() {
  group('KHQR Generator Tests', () {
    test('Should generate QR code with correct KHQR data', () {
      final khqrData = KHQRModel(
        merchantId: "123456789",
        transactionId: "TXN2024001",
        amount: 20.00,
        currency: "KHR",
      );

      final khqrWidget = KHQRGenerator(khqrModel: khqrData, size: 250.0);

      expect(khqrWidget.khqrModel.merchantId, "123456789");
      expect(khqrWidget.khqrModel.amount, 20.00);
      expect(khqrWidget.khqrModel.currency, "KHR");
    });
  });
}
