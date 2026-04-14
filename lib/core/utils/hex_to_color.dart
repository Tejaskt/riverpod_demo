import 'dart:ui';

Color hexToColor(String hex) {
  hex = hex.replaceAll("#", "FF"); // remove # and add FF

  return Color(int.parse(hex, radix: 16));
}