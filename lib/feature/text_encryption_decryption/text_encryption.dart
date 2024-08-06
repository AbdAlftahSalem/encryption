import '../../core/en_letters.dart';

class TextEncryption {
  static void textEncryption(String plainText) {
    convertPlainToInt(plainText);
  }

  static List<int> convertPlainToInt(String plain) {
    List<String> splitPlainText = plain.split('');
    List<int> convertPlainToIntList = [];
    for (String i in splitPlainText) {
      int intValueForLetter = EnLetters.enLettersStringKey[i] ?? 0;
      convertPlainToIntList.add(intValueForLetter);
    }
    return convertPlainToIntList;
  }
}
