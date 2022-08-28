import 'package:flutter/material.dart';

// class ColorManager {
//   static Color primary = const Color(0xffED9728);
//   static Color darkGrey = const Color(0xff525252);
//   static Color grey = const Color(0xff737477);
//   static Color lightGrey = const Color(0xff9E9E9E);
// }

class ColorManager {
  static Color primary = HexColor.fromHex("#ED9728");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
