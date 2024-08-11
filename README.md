<img src="assets/images/logo.png" width="300"/>

# Flutter Dart Encryption Decryption Strings

This project convert readable ( Plain String ) strings to unreadable ( Cipher String ) and decryption strings .

## Installation

To install encryption_strings , run the following command:

```bash
dart pub add encryption_strings
```

## Usage

```bash
// Test normal String [ EN ]
String plainNormalString = "Abd Alftah Salem";
String cipherNormalString = TextEncryption.textEncryption(plainNormalString); // This will generate random String every times
String encipherNormalString =
TextDecryption.textDecryption(cipherNormalString);
```

[Encryption Strings on pub.dev](https://pub.dev/packages/encryption_strings)

## Contributing

Feel free to contribute to this project by opening issues, suggesting new features, or submitting pull requests.

## License

This project is licensed under the MIT License.

---
