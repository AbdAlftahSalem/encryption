import 'dart:math';

import '../../core/en_letters.dart';
import '../../core/model/key_model.dart';
import '../../core/model/letters_key_model.dart';

class TextEncryption {
  static void textEncryption(String plainText) {
    KeyModel keyModel = _generateKey();
    List<int> plainToIntList = _convertPlainToInt(plainText);
    List<int> encryptedInts = _encryptListInt(plainToIntList, keyModel.key);
    String encryptedString =
        _convertEncryptedIntToEncryptedString(encryptedInts);
    print("Plain Text  : $plainText");
    print("Cipher Text : $encryptedString");
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

  static KeyModel _generateKey() {
    int n1 = Random().nextInt(26) + 1;
    int n2 = Random().nextInt(26) + 1;
    int n3 = Random().nextInt(26) + 1;
    int n4 = Random().nextInt(26) + 1;
    int n5 = Random().nextInt(26) + 1;
    int n6 = Random().nextInt(26) + 1;

    String l1 = EnLetters.enLettersIntKey[n1] ?? "";
    String l2 = EnLetters.enLettersIntKey[n2] ?? "";
    String l3 = EnLetters.enLettersIntKey[n3] ?? "";
    String l4 = EnLetters.enLettersIntKey[n4] ?? "";
    String l5 = EnLetters.enLettersIntKey[n5] ?? "";
    String l6 = EnLetters.enLettersIntKey[n6] ?? "";

    LettersKeyModel lettersKey = LettersKeyModel(
      n1: n1,
      n2: n2,
      n3: n3,
      n4: n4,
      n5: n5,
      n6: n6,
      l1: l1,
      l2: l2,
      l3: l3,
      l4: l4,
      l5: l5,
      l6: l6,
    );

    int key = ((lettersKey.n1 + lettersKey.n2) +
            (lettersKey.n3 / lettersKey.n4) +
            (lettersKey.n5 * lettersKey.n6))
        .toInt();

    return KeyModel(
      key: key,
      letters: lettersKey,
    );
  }
}
