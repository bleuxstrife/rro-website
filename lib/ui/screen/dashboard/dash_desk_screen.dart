import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rro_web/bloc/dashboard/dash_cubit.dart';
import 'package:rro_web/bloc/experience/exp_cubit.dart';
import 'package:rro_web/bloc/profile/pro_cubit.dart';
import 'package:rro_web/bloc/project/project_cubit.dart';
import 'package:rro_web/constant/dashboard_constant.dart';
import 'package:rro_web/utils/colors.dart';

class DashDeskScreen extends StatelessWidget {
  const DashDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashCubit()),
        BlocProvider(create: (_) => ExpCubit()..init(context)),
        BlocProvider(create: (_) => ProCubit()..init(context)),
        BlocProvider(create: (_) => ProjectCubit()..init(context))
      ],
      child: Builder(builder: (context) {
        final cubitWatch = context.watch<DashCubit>();
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(16),
          child: CollapsibleSidebar(
              title: "RRO",
              avatarImg: AssetImage(avatarImg),
              backgroundColor: AppColors.primary[50]!,
              selectedIconBox: systemPrimaryColor,
              selectedIconColor: systemWhiteColor,
              unselectedIconColor: systemPrimaryColor,
              unselectedTextColor: systemPrimaryColor,
              items: cubitWatch.items,
              sidebarBoxShadow: [
                BoxShadow(
                  color: AppColors.primary[200]!,
                  blurRadius: 10,
                  spreadRadius: 0.01,
                  offset: const Offset(3, 3),
                ),
              ],
              body: cubitWatch.child),
        ));
      }),
    );
  }
}
