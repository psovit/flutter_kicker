import 'package:flutter/material.dart';

import 'responsive.dart';

class PaddingUtils {
  static double topPadding(BuildContext ctxt) {
    if (Responsive.isDesktop(ctxt)) {
      return 100;
    }
    if (Responsive.isTablet(ctxt)) {
      return 80;
    }
    return 60;
  }
}
