class Numbers {
  // create singleton for ConstStrings
  static final Numbers instance = Numbers._internal();

  factory Numbers() => instance;

  Numbers._internal();

  Map<String, int> symbolsWithStringKey = {
    "0": 112,
    "1": 113,
    "2": 114,
    "3": 115,
    "4": 116,
    "5": 117,
    "6": 118,
    "7": 119,
    "8": 120,
    "9": 121,
  };

  Map<int, String> symbolsWithIntKey = {
    112: "0",
    113: "1",
    114: "2",
    115: "3",
    116: "4",
    117: "5",
    118: "6",
    119: "7",
    120: "8",
    121: "9",
  };
}
