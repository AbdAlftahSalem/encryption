import '../../core/en_letters.dart';
import '../../core/model/key_model.dart';
import '../../core/model/letters_key_model.dart';
import '../key_generation/extract_key.dart';
import '../key_generation/generate_key.dart';

class TextEncryption {
  static String textEncryption(String plainText) {
    KeyModel keyModel = GenerateKey.generateNewKey();
    List<int> plainToIntList = _convertPlainToInt(plainText);
    List<int> encryptedInts = _encryptListInt(plainToIntList, keyModel.key);
    String encryptedString =
        _convertEncryptedIntToEncryptedString(encryptedInts);
    String encryptedStringWithKey = _addKeyToCipheredText(
      encryptedString,
      keyModel.letters,
    );
    String extractKey = ExtractKey.extractKey(encryptedStringWithKey);

    // print("Plain Text  : $plainText");
    // print("Cipher Text : $encryptedStringWithKey");
    // print("Key : $extractKey \n\n");
    return encryptedStringWithKey;
  }

  static List<int> _convertPlainToInt(String plain) {
    List<String> splitPlainText = plain.split('');
    List<int> convertPlainToIntList = [];
    for (String i in splitPlainText) {
      int intValueForLetter = EnLetters.enLettersStringKey[i] ?? 0;
      convertPlainToIntList.add(intValueForLetter);
    }
    return convertPlainToIntList;
  }

  // equation : c = ( p + k ) %  n
  static List<int> _encryptListInt(List<int> plainInt, int key) {
    List<int> encryptedInts = [];
    for (var letterInt in plainInt) {
      int c = (letterInt + key) % 27;
      encryptedInts.add(c);
    }

    return encryptedInts;
  }

  static String _convertEncryptedIntToEncryptedString(List<int> encryptedInts) {
    List<String> encryptedStrings = [];
    for (var encryptedInt in encryptedInts) {
      String stringValue = EnLetters.enLettersIntKey[encryptedInt] ?? "";
      encryptedStrings.add(stringValue);
    }

    return encryptedStrings.join();
  }

  static _addKeyToCipheredText(
      String cipherText, LettersKeyModel lettersKeyModel) {
    String newCipherText = '';
    if (cipherText.length > 4) {
      newCipherText = lettersKeyModel.l1 +
          lettersKeyModel.l2 +
          cipherText.substring(0, cipherText.length ~/ 2);
      newCipherText += lettersKeyModel.l3 +
          lettersKeyModel.l4 +
          cipherText.substring(cipherText.length ~/ 2, cipherText.length) +
          lettersKeyModel.l5 +
          lettersKeyModel.l6;
      return newCipherText;
    } else {
      newCipherText =
          lettersKeyModel.l1 + lettersKeyModel.l2 + lettersKeyModel.l3;
      newCipherText += cipherText +
          lettersKeyModel.l4 +
          lettersKeyModel.l5 +
          lettersKeyModel.l6;
    }
    return newCipherText;
  }
}
