import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/dashboard/dash_cubit.dart';
import '../../../bloc/experience/exp_cubit.dart';
import '../../../bloc/home/home_cubit.dart';
import '../../../bloc/profile/pro_cubit.dart';
import '../../../bloc/project/project_cubit.dart';
import '../../../utils/colors.dart';

class DashMobScreen extends StatelessWidget {
  const DashMobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashCubit()..initMobile()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => ExpCubit()..init()),
        BlocProvider(create: (_) => ProCubit()..init()),
        BlocProvider(create: (_) => ProjectCubit()..init())
      ],
      child: Builder(
        builder: (context) => Scaffold(
            body: _buildBody(context),
            bottomNavigationBar: _buildBottomNavBar(context)),
      ),
    );
  }

  _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: context.watch<DashCubit>().onTabTapped,
      elevation: 20.0,
      backgroundColor: systemWhiteColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: context.watch<DashCubit>().currentPageSelected,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(Icon(Icons.home, color: systemPrimaryColor), false),
          label: "",
          activeIcon: _buildIcon(
              Icon(
                Icons.home,
                color: systemWhiteColor,
              ),
              true),
        ),
        BottomNavigationBarItem(
          icon:
              _buildIcon(Icon(Icons.person, color: systemPrimaryColor), false),
          label: "",
          activeIcon:
              _buildIcon(Icon(Icons.person, color: systemWhiteColor), true),
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
              Icon(Icons.work_history, color: systemPrimaryColor), false),
          label: "",
          activeIcon: _buildIcon(
              Icon(Icons.work_history, color: systemWhiteColor), true),
        ),
        BottomNavigationBarItem(
          icon:
              _buildIcon(Icon(Icons.folder, color: systemPrimaryColor), false),
          label: "",
          activeIcon:
              _buildIcon(Icon(Icons.folder, color: systemWhiteColor), true),
        ),
      ],
    );
  }

  Widget _buildIcon(Icon icon, bool isActive) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: systemPrimaryColor),
        child: icon,
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: icon,
      );
    }
  }

  _buildBody(BuildContext context) {
    final cubitWatch = context.watch<DashCubit>();
    return SafeArea(
        child: PageView(
      controller: cubitWatch.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: cubitWatch.pages,
    ));
  }
}
