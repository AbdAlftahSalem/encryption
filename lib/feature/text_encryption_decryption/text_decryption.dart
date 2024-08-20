import '../../core/model/key_model.dart';
import '../../core/strings/letters_init.dart';
import '../key_generation/extract_key.dart';
import '../key_generation/generate_key.dart';

class TextDecryption {
  /// Decryption [cipherText] and extract key from it .
  static String textDecryption(String cipherText) {
    // Setup letter to encryption and decryption
    LettersInit.instance.setupLetters();

    // extract key from Cipher Text
    String key = ExtractKey.extractKey(cipherText);

    // get cipher text without key
    cipherText = ExtractKey.extractCipherWithoutKey(cipherText);

    // convert Cipher Text ( String ) to Cipher Text ( List<int> )
    List<int> cipherTextAsInt = _convertCipherToInt(cipherText);

    // Decryption Cipher Text List<Int>
    List<int> plainInts = [];
    int i = 0;
    KeyModel keyModel = GenerateKey.getFullKey(key);
    while (i < (keyModel.key) + (keyModel.key % 263)) {
      plainInts = _convertCipherListIntToPlainListInt(
        i == 0 ? cipherTextAsInt : plainInts,
        key,
      );
      ++i;
    }
    // Convert Plain List<int> to readable String
    String plainText = convertPlainIntToString(plainInts);
    return plainText;
  }

  /// get cipher text without key
  static List<int> _convertCipherToInt(String cipher) {
    List<String> splitCipherText = cipher.split('');
    List<int> convertCipherToIntList = [];
    for (String i in splitCipherText) {
      int intValueForLetter = LettersInit.instance.lettersWithStringKey[i] ?? 0;
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
      int plainInt = (i - keyModel.key) % LettersInit.instance.length;
      plainInts.add(plainInt);
    }

    return plainInts;
  }

  /// Convert Plain List<int> to readable String
  static String convertPlainIntToString(List<int> plainInts) {
    List<String> plainStrings = [];
    for (int i in plainInts) {
      String letter = LettersInit.instance.lettersWithIntKey[i] ?? "";
      plainStrings.add(letter);
    }

    return plainStrings.join();
  }
}
