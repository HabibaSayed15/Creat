import 'package:flutter/material.dart';

TextStyle titles({Color colort = Colors.black, double fontSizeT = 27}) {
  return TextStyle(
      fontSize: fontSizeT, fontWeight: FontWeight.bold, color: colort);
}

TextStyle subtitles({Color colort = Colors.grey,double fontSizeT = 18}) {
  return TextStyle(fontSize: fontSizeT, fontWeight: FontWeight.w400, color: colort);
}

TextStyle smalltitles({Color colort = Colors.black}) {
  return TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: colort);
}
