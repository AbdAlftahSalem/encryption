import '../../core/strings/strings_settings.dart';
import '../../core/model/key_model.dart';
import '../key_generation/extract_key.dart';
import '../key_generation/generate_key.dart';

class TextDecryption {
  /// Decryption [cipherText] and extract key from it .
  static String textDecryption(String cipherText) {
    // extract key from Cipher Text
    String key = ExtractKey.extractKey(cipherText);

    // get cipher text without key
    cipherText = ExtractKey.extractCipherWithoutKey(cipherText);

    // convert Cipher Text ( String ) to Cipher Text ( List<int> )
    List<int> cipherTextAsInt = _convertCipherToInt(cipherText);

    // Decryption Cipher Text List<Int>
    List<int> plainInts =
        _convertCipherListIntToPlainListInt(cipherTextAsInt, key);

    // Convert Plain List<int> to readable String
    String plainText = convertPlainIntToString(plainInts);
    return plainText;
  }

  /// get cipher text without key
  static List<int> _convertCipherToInt(String cipher) {
    List<String> splitCipherText = cipher.split('');
    List<int> convertCipherToIntList = [];
    for (String i in splitCipherText) {
      int intValueForLetter = StringsSettings.instance.lettersWithStringKey[i] ?? 0;
      convertCipherToIntList.add(intValueForLetter);
    }
    return convertCipherToIntList;
  }

  /// Decryption Cipher Text List<Int>
  static List<int> _convertCipherListIntToPlainListInt(
      List<int> cipherInts, String key) {
    KeyModel keyModel = GenerateKey.getFullKey(key);
    List<int> plainInts = [];
    for (int i in cipherInts) {
      int plainInt = (i - keyModel.key) % StringsSettings.instance.length;
      plainInts.add(plainInt);
    }

    return plainInts;
  }

  /// Convert Plain List<int> to readable String
  static String convertPlainIntToString(List<int> plainInts) {
    List<String> plainStrings = [];
    for (int i in plainInts) {
      String letter = StringsSettings.instance.lettersWithIntKey[i] ?? "";
      plainStrings.add(letter);
    }

    return plainStrings.join();
  }
}
