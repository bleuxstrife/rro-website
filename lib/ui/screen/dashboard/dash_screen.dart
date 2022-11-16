import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/ui/screen/dashboard/dash_desk_screen.dart';
import 'package:rro_web/ui/screen/dashboard/dash_mob_screen.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Device.screenType == ScreenType.desktop
        ? const DashDeskScreen()
        : const DashMobScreen();
  }
}
