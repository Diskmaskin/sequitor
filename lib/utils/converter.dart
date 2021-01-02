import 'package:sequitor/controllers/conversion_controller.dart';

class Converter {
  static String convert(
      ConversionController fromController, double input, ConversionController toController) {
    double from = fromController.conversionMap[fromController.unitSystem]['units']
            [fromController.unit] *
        fromController.conversionMap[fromController.unitSystem]['reference'];
    double to = toController.conversionMap[toController.unitSystem]['units'][toController.unit] *
        toController.conversionMap[toController.unitSystem]['reference'];
    double result = input * (from / to);
    return result.toString();
  }
}
