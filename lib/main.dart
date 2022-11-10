import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:rro_web/app.dart';

void main() {
  ResponsiveGridBreakpoints.value = ResponsiveGridBreakpoints(
    xs: 600,
    sm: 905,
    md: 1240,
    lg: 1440,
  );
  runApp(const App());
}
