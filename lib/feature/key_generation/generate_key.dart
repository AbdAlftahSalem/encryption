import 'dart:math';

import '../../core/model/key_model.dart';
import '../../core/model/letters_key_model.dart';
import '../../core/strings/strings_settings.dart';

/*
1- If plain text 1 letter ( Key generate using 3 letters ). equation => ket = (n1 * 8) ^ n1
2- If plain text 5 to 2 letters  ( Key generate using 3 letters ). equation => ket = (n1 * n2) ^ n3
3- If plain text more than 5 letter ( Key generate using 6 letters ) . equation => Key = ( n1 + n2 ) + ( n3 / n4 ) + ( n5 * n6 )
*/

class GenerateKey {
  //. Generate a random key with 6 digits of letters
  static KeyModel generateNewKey() {
    // generate random 6 number start from 1 and end in 27
    int n1 = Random().nextInt(StringsSettings.instance.length - 1) + 1;
    int n2 = Random().nextInt(StringsSettings.instance.length - 1) + 1;
    int n3 = Random().nextInt(StringsSettings.instance.length - 1) + 1;
    int n4 = Random().nextInt(StringsSettings.instance.length - 1) + 1;
    int n5 = Random().nextInt(StringsSettings.instance.length - 1) + 1;
    int n6 = Random().nextInt(StringsSettings.instance.length - 1) + 1;

    // Get key string by generated random numbers
    String l1 = StringsSettings.instance.lettersWithIntKey[n1] ?? "";
    String l2 = StringsSettings.instance.lettersWithIntKey[n2] ?? "";
    String l3 = StringsSettings.instance.lettersWithIntKey[n3] ?? "";
    String l4 = StringsSettings.instance.lettersWithIntKey[n4] ?? "";
    String l5 = StringsSettings.instance.lettersWithIntKey[n5] ?? "";
    String l6 = StringsSettings.instance.lettersWithIntKey[n6] ?? "";

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

    int n1 = StringsSettings.instance.lettersWithStringKey[keySplit[0]] ?? 0;
    int n2 = StringsSettings.instance.lettersWithStringKey[keySplit[1]] ?? 0;
    int n3 = StringsSettings.instance.lettersWithStringKey[keySplit[2]] ?? 0;
    int n4 = StringsSettings.instance.lettersWithStringKey[keySplit[3]] ?? 0;
    int n5 = StringsSettings.instance.lettersWithStringKey[keySplit[4]] ?? 0;
    int n6 = StringsSettings.instance.lettersWithStringKey[keySplit[5]] ?? 0;

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
