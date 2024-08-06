class ExtractKey {
  static String extractKey(String cipherText) {
    String fullKey = "";

    if ((cipherText.length - 6) > 4) {
      fullKey = _getKeyWithCipherMoreThan4Letters(cipherText);
    } else {
      fullKey = _getKeyWithCipherLessThan4Letters(cipherText);
    }
    return fullKey;
  }

  static String _getKeyWithCipherLessThan4Letters(String cipherText) {
    String key = "";
    key = cipherText[0] + cipherText[1] + cipherText[2];
    key += cipherText[cipherText.length - 3] +
        cipherText[cipherText.length - 2] +
        cipherText[cipherText.length - 1];
    return key;
  }

  static String _getKeyWithCipherMoreThan4Letters(String cipherText) {
    String firstDigitsKey = "";
    String lastDigitsKey = "";
    String midDigitsKey = "";
    firstDigitsKey = cipherText[0] + cipherText[1];
    lastDigitsKey =
        cipherText[cipherText.length - 2] + cipherText[cipherText.length - 1];
    cipherText = cipherText.replaceRange(0, 2, "");
    cipherText = cipherText.replaceRange(
      cipherText.length - 2,
      cipherText.length - 1,
      "",
    );

    if (cipherText.length % 2 != 0) {
      midDigitsKey += cipherText[(cipherText.length ~/ 2 )- 1] +
          cipherText[(cipherText.length ~/ 2)];
    } else {
      midDigitsKey = cipherText[(cipherText.length ~/ 2) - 2] +
          cipherText[((cipherText.length ~/ 2) - 1)];
    }
    // midDigitsKey = cipherText[((cipherText.length / 2 +
    //             (cipherText.length / 2 +
    //                     ((cipherText.length - 6) % 2 == 0 ? 0 : 1))
    //                 .toInt())
    //         .toInt())] +
    //     cipherText[
    //         (cipherText.length / 2 + ((cipherText.length - 6) % 2 == 0 ? 0 : 1))
    //             .toInt()];

    return firstDigitsKey + midDigitsKey + lastDigitsKey;
  }
}
