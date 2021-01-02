class Calculator {
  static const List<String> ACCEPTED_CHARS = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    ADD,
    SUB,
    MULT,
    DIV,
    REMAIN,
    PAR_START,
    PAR_END
  ];
  static const String ADD = '+';
  static const String SUB = '-';
  static const String MULT = 'x';
  static const String DIV = '/';
  static const String REMAIN = '%';
  static const String PAR_START = '(';
  static const String PAR_END = ')';

  static double add(double a, double b) {
    return a + b;
  }

  static double sub(double a, double b) {
    return a - b;
  }

  static double mult(double a, double b) {
    return a * b;
  }

  static double div(double a, double b) {
    return a / b;
  }

  static double remain(double a, double b) {
    return a % b;
  }

  static String operatorStringSplit(String input) {
    if (input.contains(RegExp('[$ADD|\\$SUB|$MULT|$DIV|$REMAIN]'))) {
      print('contains: ${input.split(RegExp('[$ADD|\\$SUB|$MULT|$DIV|$REMAIN]'))}');
      return input.split(RegExp('[$ADD|\\$SUB|$MULT|$DIV|$REMAIN]'))[0];
    }
    return input;
  }

  // What percentage is a of b?
  static double percentageAOfB(double a, double b) {
    return (a / b) * 100;
  }

  // What is a% of b?
  static double percentAOfB(double a, double b) {
    return (a * b) / 100;
  }

  // What's the percentage change between a and b?
  static double percentageChange(double a, double b) {
    return ((b - a) / a) * 100;
  }

  static String calculateString(String input) {
    String result = input;
    print('input: $result');

    // Check input for negative values

    // Check for parentheses and recursively calculates those first
    //TODO: Implement multiplication if parentheses are not given a leading operator
    if (result.contains('(')) {
      for (String s in result.split('(')) {
        if (s.contains(')')) {
          result = result.replaceFirst(s, calculateString(s));
        }
      }
    }
    // Removes remaining parentheses that are no longer paired if there are any
    result = result.replaceAll('(', '').replaceAll(')', '');

    // Calculates every pair of number in order of operations
    for (int i = 0; i < input.split(RegExp('[$ADD|\\$SUB|$MULT|$DIV|$REMAIN]')).length - 1; i++) {
      String targetOperator;
      Function targetCalculation;
      if (result.contains(MULT)) {
        targetOperator = MULT;
        targetCalculation = mult;
      } else if (result.contains(DIV)) {
        targetOperator = DIV;
        targetCalculation = div;
      } else if (result.contains(REMAIN)) {
        targetOperator = REMAIN;
        targetCalculation = remain;
      } else if (result.contains(ADD)) {
        targetOperator = ADD;
        targetCalculation = add;
      } else if (result.contains(SUB)) {
        targetOperator = SUB;
        targetCalculation = sub;
      }

      var split = result.split(targetOperator);
      String a = split[0];
      String b = operatorStringSplit(split[1]);
      if (b == '') {
        b = '0';
      }
      print('a: $a');
      print('b: $b');
      result = result.replaceFirst(
          '$a$targetOperator$b', targetCalculation(double.parse(a), double.parse(b)).toString());
      print(result);
    }

    return result;
  }
}
