import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/ui/widgets/minor_ui.dart';

import '../../../bloc/home/home_cubit.dart';
import '../../../constant/dashboard_constant.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import '../../widgets/space.dart';

class HomeMobScreen extends StatelessWidget {
  const HomeMobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar("Home"),
      body: _buildContent(context),
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _welcome(),
              Space.vMedium,
              _intro(),
              Space.vLarge,
              _contact(context)
            ]),
      ),
    );
  }

  _welcome() {
    return Column(
      children: [
        Assets.images.icApp512.image(width: 45.sp, height: 45.sp),
        Space.vMedium,
        Text(
          "Welcome to RRO",
          style: contentPrimaryBold.copyWith(fontSize: 20.sp),
        )
      ],
    );
  }

  _intro() {
    return Text(
      homeContent,
      style: contentPrimaryBold.copyWith(fontSize: 17.sp),
      textAlign: TextAlign.center,
    );
  }

  _contact(BuildContext context) {
    var listItem = context.watch<HomeCubit>().getAllContact;
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.0,
      runSpacing: 12.0,
      children: listItem
          .map<Widget>((e) => _item(e.name, e.icon, e.onClicked))
          .toList(),
    );
  }

  _item(String title, Widget icon, ContactOnClicked onClicked) {
    return InkWell(
      onTap: () => onClicked(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primary[400]!,
                blurRadius: 10,
                spreadRadius: 0.01,
                offset: const Offset(3, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            color: systemPrimaryColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            Space.hSmall,
            Text(
              title,
              style: contentBold.copyWith(color: systemWhiteColor, fontSize: 15.sp),
            )
          ],
        ),
      ),
    );
  }
}
