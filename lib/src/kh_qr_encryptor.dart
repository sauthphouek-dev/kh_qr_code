import 'package:encrypt/encrypt.dart';

class KHQREncryptor {
  static final key = Key.fromUtf8("16CharSecureKey!");
  static final iv = IV.fromLength(16);
  static final encryptor = Encrypter(AES(key));

  static String encrypt(String data) {
    return encryptor.encrypt(data, iv: iv).base64;
  }

  static String decrypt(String encryptedData) {
    return encryptor.decrypt64(encryptedData, iv: iv);
  }
}
