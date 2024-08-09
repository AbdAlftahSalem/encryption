import 'core/strings/strings_settings.dart';
import './feature/text_encryption_decryption/text_decryption.dart';
import './feature/text_encryption_decryption/text_encryption.dart';

void main(List<String> arguments) {
  // Setup letter to encryption and decryption
  StringsSettings.instance.setupLetters();

  // Test code
  String plain = "Abd Alftah Salem";
  String cipher = TextEncryption.textEncryption(plain);
  String plainEncipher = TextDecryption.textDecryption(cipher);
  print("Plain Text     : $plain");
  print("Cipher Text    : $cipher");
  print("Plain Encipher : $plainEncipher");
}
