import '../../core/en_letters.dart';
import '../../core/model/key_model.dart';
import '../../core/model/letters_key_model.dart';
import '../key_generation/extract_key.dart';
import '../key_generation/generate_key.dart';

class TextDecryption {
  static String textDecryption(String cipherText) {
    String key = ExtractKey.extractKey(cipherText);
    List<int> intKey = _convertStringKeyToListInt(key);
    LettersKeyModel lettersKeyModel = LettersKeyModel(
      n1: intKey[0],
      n2: intKey[1],
      n3: intKey[2],
      n4: intKey[3],
      n5: intKey[4],
      n6: intKey[5],
      l1: key[0],
      l2: key[1],
      l3: key[2],
      l4: key[3],
      l5: key[4],
      l6: key[5],
    );
    cipherText = ExtractKey.extractCipherWithoutKey(cipherText);
    print(cipherText.length);
    List<int> cipherTextAsInt = _convertCipherToInt(cipherText);
    List<int> plainInts =
        _convertCipherListIntToPlainListInt(cipherTextAsInt, key);
    String plainText = convertPlainIntToString(plainInts);

    return plainText;
  }

  static List<int> _convertCipherToInt(String cipher) {
    List<String> splitCipherText = cipher.split('');
    List<int> convertCipherToIntList = [];
    for (String i in splitCipherText) {
      int intValueForLetter = EnLetters.enLettersStringKey[i] ?? 0;
      convertCipherToIntList.add(intValueForLetter);
    }
    return convertCipherToIntList;
  }

  static List<int> _convertStringKeyToListInt(String key) {
    List<String> splitKey = key.split("");
    List<int> intKey = [];
    for (String letter in splitKey) {
      int value = EnLetters.enLettersStringKey[letter] ?? 0;
      intKey.add(value);
    }
    return intKey;
  }

  static List<int> _convertCipherListIntToPlainListInt(
      List<int> cipherInts, String key) {
    KeyModel keyModel = GenerateKey.getFullKey(key);
    List<int> plainInts = [];
    for (int i in cipherInts) {
      int plainInt = (i - keyModel.key) % 27;
      plainInts.add(plainInt);
    }

    return plainInts;
  }

  static String convertPlainIntToString(List<int> plainInts) {
    List<String> plainStrings = [];
    for (int i in plainInts) {
      String letter = EnLetters.enLettersIntKey[i] ?? "";
      plainStrings.add(letter);
    }

    return plainStrings.join();
  }
}
