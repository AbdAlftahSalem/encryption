import './letters/symbol.dart';
import 'letters/en_letters.dart';

class LettersInit {
  // create singleton for ConstStrings
  static final LettersInit instance = LettersInit._internal();

  factory LettersInit() => instance;

  LettersInit._internal();

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
