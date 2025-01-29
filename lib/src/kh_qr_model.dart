import 'dart:convert';

class KHQRModel {
  final String merchantId;
  final String transactionId;
  final double amount;
  final String currency;
  final String qrVersion;

  KHQRModel({
    required this.merchantId,
    required this.transactionId,
    required this.amount,
    required this.currency,
    this.qrVersion = "01",
  });

  Map<String, dynamic> toJson() => {
        "merchant_id": merchantId,
        "transaction_id": transactionId,
        "amount": amount.toStringAsFixed(2),
        "currency": currency,
        "qr_version": qrVersion,
      };

  String encode() => jsonEncode(toJson());

  static KHQRModel decode(String jsonString) {
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return KHQRModel(
      merchantId: jsonData["merchant_id"],
      transactionId: jsonData["transaction_id"],
      amount: double.parse(jsonData["amount"]),
      currency: jsonData["currency"],
      qrVersion: jsonData["qr_version"],
    );
  }
}
