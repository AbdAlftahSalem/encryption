import './letters_key_model.dart';

class KeyModel {
  int key;
  LettersKeyModel letters;

  KeyModel({required this.key, required this.letters});

  @override
  String toString() {
    return 'KeyModel{key: $key, letters: $letters}';
  }
}
