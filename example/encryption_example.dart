import '../lib/encryption.dart';

void main() {

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

}
