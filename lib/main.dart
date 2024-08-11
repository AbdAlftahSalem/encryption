import './feature/text_encryption_decryption/text_decryption.dart';
import './feature/text_encryption_decryption/text_encryption.dart';
import 'core/strings/letters_init.dart';

void main(List<String> arguments) {
  // Setup letter to encryption and decryption
  LettersInit.instance.setupLetters();

  // Test normal String [ EN ]
  String plainNormalString = "Abd Alftah Salem";
  String cipherNormalString = TextEncryption.textEncryption(plainNormalString);
  String encipherNormalString =
      TextDecryption.textDecryption(cipherNormalString);

  // Test symbols
  String plainSymbolString = "(=++*/\$@!*)";
  String cipherSymbolString = TextEncryption.textEncryption(plainSymbolString);
  String encipherSymbolString =
      TextDecryption.textDecryption(cipherSymbolString);

  print("\n" + ("*" * 25) + "  Test Normal String  " + ("*" * 25));
  print("Plain Normal Text     : $plainNormalString");
  print("Cipher Normal Text    : $cipherNormalString");
  print("Encipher Normal Text  : $encipherNormalString");

  print("\n" + ("*" * 25) + "  Test Symbols String  " + ("*" * 25));
  print("Plain Symbol Text     : $plainSymbolString");
  print("Cipher Symbol Text    : $cipherSymbolString");
  print("Encipher Symbol Text  : $encipherSymbolString");
}
