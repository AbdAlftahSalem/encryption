// ToDO : This need som refactor
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

  static extractCipherWithoutKey(String cipherText) {
    String newCipherText = "";
    if ((cipherText.length - 6) > 4) {
      newCipherText = cipherText.replaceRange(0, 2, "");
      newCipherText = newCipherText.replaceRange(
          newCipherText.length - 2, newCipherText.length, "");

      int start = (newCipherText.length ~/ 2) - 1;
      int end = (newCipherText.length ~/ 2) + 1;

      newCipherText =
          newCipherText.substring(0, start) + "" + newCipherText.substring(end);

      return newCipherText;
    } else {
      newCipherText = cipherText.replaceRange(0, 3, "");
      newCipherText =
          newCipherText.replaceRange(newCipherText.length - 3, null, "");
      return newCipherText;
    }
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
      midDigitsKey += cipherText[(cipherText.length ~/ 2) - 1] +
          cipherText[(cipherText.length ~/ 2)];
    } else {
      midDigitsKey = cipherText[(cipherText.length ~/ 2) - 2] +
          cipherText[((cipherText.length ~/ 2) - 1)];
    }

    return firstDigitsKey + midDigitsKey + lastDigitsKey;
  }
}
