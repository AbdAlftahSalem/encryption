<img src="assets/images/logo.png" width="300"/>

# Flutter Dart Thunder Encryption Decryption

This project convert readable ( Plain ) strings to unreadable ( Cipher ) and decryption strings .

## Installation

To install thunder_encryption , run the following command:

```bash
dart pub add thunder_encryption
```

## Usage

```bash
// Test String [ EN ]
String plainString = "Abd Alftah Salem";
String cipherString = TextEncryption.textEncryption(plainString); // This will generate random String every times
String encipherString =
TextDecryption.textDecryption(cipherString);
```

[Thunder Encryption on pub.dev](https://pub.dev/packages/thunder_encryption)

## Contributing

Feel free to contribute to this project by opening issues, suggesting new features, or submitting pull requests , or add
new languages.

### Add Languages:

1- Go to lib/core/strings<br>
2- Create new file for new language ex [ en_letters / ar_letters ]<br>
3- create a Map<String , int> for letter to use it in encryption and create Map<int , String> to use in decryption<br>
```bash
class EnLetters {
  // create singleton for ConstStrings
  static final EnLetters instance = EnLetters._internal();

  factory EnLetters() => instance;

  EnLetters._internal();

  Map<String, int> enSmallLettersStringKey = {
    "a": 0,
    "b": 1,
  }
  
  Map<int, String> enSmallLettersIntKey = {
    0: "a",
    1: "b",
  }
}

```
4- Go to lib/core/strings/letters_init.dart then add new language in setupLetters method

## License

This project is licensed under the MIT License.

---
