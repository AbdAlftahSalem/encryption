import 'dart:math';

import '../../core/en_letters.dart';
import '../../core/model/key_model.dart';
import '../../core/model/letters_key_model.dart';

class GenerateKey {
  static KeyModel generateKey() {
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