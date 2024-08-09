import './en_letters.dart';

class StringsSettings {
  // create singleton for ConstStrings
  static final StringsSettings instance = StringsSettings._internal();

  factory StringsSettings() => instance;

  StringsSettings._internal();

  Map<int, String> lettersWithIntKey = {};
  Map<String, int> lettersWithStringKey = {};
  int length = 0;

  void setupLetters() {
    // Setup maps with int key
    lettersWithIntKey.addAll(EnLetters.instance.enSmallLettersIntKey);
    lettersWithIntKey.addAll(EnLetters.instance.enCapitalLettersIntKey);

    // Setup maps with string key
    lettersWithStringKey.addAll(EnLetters.instance.enSmallLettersStringKey);
    lettersWithStringKey.addAll(EnLetters.instance.enCapitalLettersStringKey);

    length = lettersWithStringKey.length;
  }
}
