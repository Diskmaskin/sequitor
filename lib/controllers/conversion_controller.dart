import 'package:flutter/widgets.dart';
import 'package:sequitor/ui/consts/mass.dart';

enum ConversionType {
  MASS,
  DISTANCE,
}

class ConversionController extends TextEditingController {
  ConversionController(this.translationType) {
    if (translationType == ConversionType.MASS) {
      conversionMap = massUnitSystems;
    } else if (translationType == ConversionType.DISTANCE) {
      conversionMap = null;
    }
    unitSystem = conversionMap.keys.elementAt(0);
    unit = conversionMap[unitSystem]['units'].keys.elementAt(0);
  }
  final ConversionType translationType;
  Map<String, dynamic> conversionMap;
  String unitSystem;
  String unit;
}
