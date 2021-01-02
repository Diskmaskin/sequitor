import 'package:flutter/widgets.dart';
import 'package:sequitor/utils/calculator.dart';

class CalculationController extends TextEditingController {
  String get calculatedText => Calculator.calculateString(this.text);
  double get calculatedDouble => double.parse(Calculator.calculateString(this.text));

  // Checks if string contains nonaccepted characters
  bool _acceptedStringCheck(String newText) {
    for (String e in newText.characters) {
      if (!Calculator.ACCEPTED_CHARS.contains(e)) return false;
    }
    return true;
  }

  @override
  set text(String newText) {
    value = value.copyWith(
      text: (_acceptedStringCheck(newText)) ? newText : value.text,
      selection: const TextSelection.collapsed(offset: -1),
      composing: TextRange.empty,
    );
  }

  @override
  set value(TextEditingValue newValue) {
    assert(
      !newValue.composing.isValid || newValue.isComposingRangeValid,
      'New TextEditingValue $newValue has an invalid non-empty composing range '
      '${newValue.composing}. It is recommended to use a valid composing range, '
      'even for readonly text fields',
    );
    super.value = newValue.copyWith(
        text: (_acceptedStringCheck(newValue.text)) ? newValue.text : super.value.text);
  }
}
