import '../../core/strings/letters_init.dart';
import '../../core/model/key_model.dart';
import '../../core/model/letters_key_model.dart';
import '../key_generation/generate_key.dart';

class TextEncryption {
  /// Encryption [plainText] and generate random key
  static String textEncryption(String plainText) {
    // generate Key
    KeyModel keyModel = GenerateKey.generateNewKey();

    // Convert Plain String to list of plain int
    List<int> plainToIntList = _convertPlainToInt(plainText);

    // Encrypt list<int>
    List<int> encryptedInts = _encryptListInt(plainToIntList, keyModel.key);

    //  Convert list<int> to cipher text
    String encryptedString =
        _convertEncryptedIntToEncryptedString(encryptedInts);

    // Hide key in cipher text to extract it when decrypt
    String encryptedStringWithKey = _addKeyToCipheredText(
      encryptedString,
      keyModel.letters,
    );

    return encryptedStringWithKey;
  }

  /// Convert Plain String to list of plain int
  static List<int> _convertPlainToInt(String plain) {
    List<String> splitPlainText = plain.split('');
    List<int> convertPlainToIntList = [];
    for (String i in splitPlainText) {
      int intValueForLetter =
          LettersInit.instance.lettersWithStringKey[i] ?? 0;
      convertPlainToIntList.add(intValueForLetter);
    }
    return convertPlainToIntList;
  }

  /// Encrypt list<int>
  /// Equation for encryption : c = ( p + k ) %  n
  static List<int> _encryptListInt(List<int> plainInt, int key) {
    List<int> encryptedInts = [];
    for (var letterInt in plainInt) {
      int c = (letterInt + key) % LettersInit.instance.length;
      encryptedInts.add(c);
    }

    return encryptedInts;
  }

  ///  Convert list<int> encrypted int to cipher text [ return String ]
  static String _convertEncryptedIntToEncryptedString(List<int> encryptedInts) {
    List<String> encryptedStrings = [];
    for (var encryptedInt in encryptedInts) {
      String stringValue =
          LettersInit.instance.lettersWithIntKey[encryptedInt] ?? "";
      encryptedStrings.add(stringValue);
    }

    return encryptedStrings.join();
  }

  /// Hide Key in cipher text
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
