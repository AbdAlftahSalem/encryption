import './en_letters.dart';
import './symbol.dart';

class StringsSettings {
  // create singleton for ConstStrings
  static final StringsSettings instance = StringsSettings._internal();

  factory StringsSettings() => instance;

  StringsSettings._internal();

  Map<int, String> lettersWithIntKey = {};
  Map<String, int> lettersWithStringKey = {};
  int length = 0;

  void setupLetters() {
    // Setup EN letters
    lettersWithIntKey.addAll(EnLetters.instance.enSmallLettersIntKey);
    lettersWithIntKey.addAll(EnLetters.instance.enCapitalLettersIntKey);
    lettersWithStringKey.addAll(EnLetters.instance.enSmallLettersStringKey);
    lettersWithStringKey.addAll(EnLetters.instance.enCapitalLettersStringKey);

    // Setup Symbols
    lettersWithStringKey.addAll(Symbols.instance.symbolsWithStringKey);
    lettersWithIntKey.addAll(Symbols.instance.symbolsWithIntKey);

    length = lettersWithStringKey.length;
  }
}
