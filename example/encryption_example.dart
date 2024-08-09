import '../lib/encryption.dart';

void main() {
  String plainText = "abd alftah salem";
  String cipherText = TextEncryption.textEncryption(plainText);
  String encipherText = TextDecryption.textDecryption(cipherText);
  print('Plain Text    : $plainText');
  print('Cipher Text   : $cipherText');
  print('Encipher Text : $encipherText');
}
