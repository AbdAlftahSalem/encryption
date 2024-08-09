class ExtractKey {
  /// Get Key from [cipherText]
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
      // Get first 2 digits
      newCipherText = cipherText.replaceRange(0, 2, "");

      // Get Last tow digits
      newCipherText = newCipherText.replaceRange(
          newCipherText.length - 2, newCipherText.length, "");

      // Get the middle digits
      int startIndex = (newCipherText.length ~/ 2) - 1;
      int endIndex = (newCipherText.length ~/ 2) + 1;

      newCipherText = newCipherText.substring(0, startIndex) +
          "" +
          newCipherText.substring(endIndex);

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

    // Get first 2 digits
    firstDigitsKey = cipherText[0] + cipherText[1];

    // Get Last tow digits
    lastDigitsKey =
        cipherText[cipherText.length - 2] + cipherText[cipherText.length - 1];
    cipherText = cipherText.replaceRange(0, 2, "");
    cipherText = cipherText.replaceRange(
      cipherText.length - 2,
      cipherText.length - 1,
      "",
    );

    // Get the middle digits
    if (cipherText.length % 2 != 0) {
      int startIndex = (cipherText.length ~/ 2) - 1;
      int endIndex = (cipherText.length ~/ 2);
      midDigitsKey += cipherText[startIndex] + cipherText[endIndex];
    } else {
      int startIndex = (cipherText.length ~/ 2) - 2;
      int endIndex = ((cipherText.length ~/ 2) - 1);
      midDigitsKey = cipherText[startIndex] + cipherText[endIndex];
    }

    return firstDigitsKey + midDigitsKey + lastDigitsKey;
  }
}
