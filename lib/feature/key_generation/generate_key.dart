import 'dart:math';

import '../../core/en_letters.dart';
import '../../core/model/key_model.dart';
import '../../core/model/letters_key_model.dart';

class GenerateKey {
  //. Generate a random key with 6 digits of letters
  static KeyModel generateNewKey() {
    // generate random 6 number start from 1 and end in 27
    int n1 = Random().nextInt(26) + 1;
    int n2 = Random().nextInt(26) + 1;
    int n3 = Random().nextInt(26) + 1;
    int n4 = Random().nextInt(26) + 1;
    int n5 = Random().nextInt(26) + 1;
    int n6 = Random().nextInt(26) + 1;

    // Get key string by generated random numbers
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

    // Build Key with this equation => ( n1 + n2 ) + ( n3 / n4 ) + ( n5 * n6 )
    int key = ((lettersKey.n1 + lettersKey.n2) +
            (lettersKey.n3 / lettersKey.n4) +
            (lettersKey.n5 * lettersKey.n6))
        .toInt();

    return KeyModel(
      key: key,
      letters: lettersKey,
    );
  }

  /// get Full Key model by know [key] as string
  static KeyModel getFullKey(String key) {
    List<String> keySplit = key.split("");

    int n1 = EnLetters.enLettersStringKey[keySplit[0]] ?? 0;
    int n2 = EnLetters.enLettersStringKey[keySplit[1]] ?? 0;
    int n3 = EnLetters.enLettersStringKey[keySplit[2]] ?? 0;
    int n4 = EnLetters.enLettersStringKey[keySplit[3]] ?? 0;
    int n5 = EnLetters.enLettersStringKey[keySplit[4]] ?? 0;
    int n6 = EnLetters.enLettersStringKey[keySplit[5]] ?? 0;

    LettersKeyModel lettersKey = LettersKeyModel(
      n1: n1,
      n2: n2,
      n3: n3,
      n4: n4,
      n5: n5,
      n6: n6,
      l1: keySplit[0],
      l2: keySplit[1],
      l3: keySplit[2],
      l4: keySplit[3],
      l5: keySplit[4],
      l6: keySplit[5],
    );

    int intKey = ((lettersKey.n1 + lettersKey.n2) +
            (lettersKey.n3 / lettersKey.n4) +
            (lettersKey.n5 * lettersKey.n6))
        .toInt();
    return KeyModel(key: intKey, letters: lettersKey);
  }
}
