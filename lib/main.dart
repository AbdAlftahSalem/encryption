import './feature/text_encryption_decryption/text_decryption.dart';
import './feature/text_encryption_decryption/text_encryption.dart';

void main(List<String> arguments) {
  String cipher = TextEncryption.textEncryption("abdabd");
  String plain = TextDecryption.textDecryption(cipher);
}
