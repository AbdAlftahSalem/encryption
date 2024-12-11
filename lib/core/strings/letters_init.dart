import './letters/symbol.dart';
import 'letters/ar_letters.dart';
import 'letters/en_letters.dart';
import 'letters/numbers.dart';

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

    // Setup AR letters
    lettersWithStringKey.addAll(ArLetters.instance.arLettersStringKey);
    lettersWithIntKey.addAll(ArLetters.instance.arLettersIntKey);

    // Add nu,bers
    lettersWithStringKey.addAll(Numbers.instance.symbolsWithStringKey);
    lettersWithIntKey.addAll(Numbers.instance.symbolsWithIntKey);

    length = lettersWithStringKey.length;
  }
}
