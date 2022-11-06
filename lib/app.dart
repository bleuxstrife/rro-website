import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:rro_web/utils/colors.dart';

import 'ui/screen/dashboard/dash_desk_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (_, __, ___) => MaterialApp(
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
                scaffoldBackgroundColor: AppColors.primary[100]!
              ),
              home: const DashDeskScreen(),
            ));
  }
}
