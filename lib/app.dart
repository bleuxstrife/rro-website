import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/ui/screen/dashboard/dash_screen.dart';

import 'package:rro_web/utils/colors.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        maxTabletWidth: 700,
        builder: (_, __, ___) => MaterialApp(
              title: "RRO",
              theme: ThemeData(
                  fontFamily: 'Proxima',
                  colorScheme: ColorScheme(
                      primary: AppColors.primary,
                      secondary: AppColors.primary,
                      surface: AppColors.primary,
                      background: AppColors.primary[0]!,
                      error: systemRedColor,
                      onBackground: AppColors.primary[0]!,
                      onSurface: AppColors.primary,
                      onError: systemRedColor,
                      onPrimary: AppColors.primary,
                      onSecondary: AppColors.primary,
                      brightness: Brightness.light),
                  brightness: Brightness.light,
                  primarySwatch: AppColors.primary,
                  primaryColor: AppColors.primary,
                  scaffoldBackgroundColor: AppColors.primary[100]!),
              home: const DashScreen(),
            ));
  }
}
