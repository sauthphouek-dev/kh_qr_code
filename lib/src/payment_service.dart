import 'dart:convert';
import 'package:http/http.dart' as http;
import 'kh_qr_model.dart';

class PaymentService {
  final String backendUrl;

  PaymentService({required this.backendUrl});

  Future<bool> verifyPayment(KHQRModel khqrModel) async {
    final response = await http.post(
      Uri.parse('$backendUrl/verify-payment'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(khqrModel.toJson()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["success"] ?? false;
    } else {
      throw Exception('Payment verification failed');
    }
  }
}
