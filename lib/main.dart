import './feature/text_encryption_decryption/text_decryption.dart';
import './feature/text_encryption_decryption/text_encryption.dart';
import 'core/strings/letters_init.dart';

void main(List<String> arguments) {
  // Setup letter to encryption and decryption
  LettersInit.instance.setupLetters();

  // Test normal String [ EN ]
  String plainEnString = "Abd Alftah Nedal AlShanti";
  String cipherEnString = TextEncryption.textEncryption(plainEnString);
  String encipherEnString = TextDecryption.textDecryption(cipherEnString);

  // // Test symbols
  // String plainSymbolString = "(=++*/\$@!*)";
  // String cipherSymbolString = TextEncryption.textEncryption(plainSymbolString);
  // String encipherSymbolString =
  //     TextDecryption.textDecryption(cipherSymbolString);
  //
  // // Test normal String [ AR ]
  // String plainArString = "عبد الفتاح نضال الشنطي";
  // String cipherArString = TextEncryption.textEncryption(plainArString);
  // String encipherArString = TextDecryption.textDecryption(cipherArString);

  print("\n" + ("*" * 25) + "  Test EN String  " + ("*" * 25));
  print("Plain EN Text     : $plainEnString");
  print("Cipher EN Text    : $cipherEnString");
  print("Encipher EN Text  : $encipherEnString");

  // print("\n" + ("*" * 25) + "  Test Symbols String  " + ("*" * 25));
  // print("Plain Symbol Text     : $plainSymbolString");
  // print("Cipher Symbol Text    : $cipherSymbolString");
  // print("Encipher Symbol Text  : $encipherSymbolString");
  //
  // print("\n" + ("*" * 25) + "  Test AR String  " + ("*" * 25));
  // print("Plain AR Text     : $plainArString");
  // print("Cipher AR Text    : $cipherArString");
  // print("Encipher AR Text  : $encipherArString");
}
