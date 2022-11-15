import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/bloc/home/home_cubit.dart';
import 'package:rro_web/gen/assets.gen.dart';
import 'package:rro_web/ui/widgets/space.dart';
import 'package:rro_web/utils/texts.dart';

import '../../../constant/dashboard_constant.dart';
import '../../../utils/colors.dart';

class HomeDeskScreen extends StatelessWidget {
  const HomeDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16),
        child: Center(child: _buildContent(context)));
  }

  _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _welcome(),
        Space.vMedium,
        _intro(),
        Space.vLarge,
        _contact(context)
      ],
    );
  }

  _welcome() {
    return Column(
      children: [
        Assets.images.icApp512.image(width: 35.sp, height: 35.sp),
        Space.vMedium,
        Text(
          "Welcome to RRO",
          style: contentPrimaryBold.copyWith(fontSize: 18.sp),
        )
      ],
    );
  }

  _intro() {
    return Text(
      homeContent,
      style: contentPrimaryBold.copyWith(fontSize: 13.sp),
      textAlign: TextAlign.center,
    );
  }

  _contact(BuildContext context) {
    var listItem = context.watch<HomeCubit>().getAllContact;
    return Wrap(
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
              style: contentBold.copyWith(color: systemWhiteColor),
            )
          ],
        ),
      ),
    );
  }
}
