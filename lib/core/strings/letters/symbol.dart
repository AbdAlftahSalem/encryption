class Symbols {
  // create singleton for ConstStrings
  static final Symbols instance = Symbols._internal();

  factory Symbols() => instance;

  Symbols._internal();

  Map<String, int> symbolsWithStringKey = {
    " ": 52,
    "/": 53,
    "*": 54,
    "-": 55,
    "+": 56,
    "!": 57,
    "@": 58,
    "#": 59,
    "\$": 60,
    "%": 61,
    "^": 62,
    "&": 63,
    "(": 64,
    ")": 65,
    "_": 66,
    "=": 67,
    "\\": 68,
    ">": 69,
    "<": 70,
    "}": 71,
    "{": 72,
    ":": 73,
    ";": 74,
    "'": 75,
    '"': 76,
  };
  Map<int, String> symbolsWithIntKey = {
    52: " ",
    53: "/",
    54: "*",
    55: "-",
    56: "+",
    57: "!",
    58: "@",
    59: "#",
    60: "\$",
    61: "%",
    62: "^",
    63: "&",
    64: "(",
    65: ")",
    66: "_",
    67: "=",
    68: "\\",
    69: ">",
    70: "<",
    71: "}",
    72: "{",
    73 :":",
    74: ";",
    75: "'",
    76: '"',
  };
}