import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppFonts {
  /// --- Private internal constructor --- \\\
  AppFonts._i();

  static String lato = 'Lato';

  static TextStyle txtNormal = TextStyle(fontFamily: lato, fontSize: 14.sp);

  static TextStyle txtHeading = TextStyle(
    fontFamily: lato,
    fontSize: 18.sp,
    fontWeight: .bold,
  );
}
