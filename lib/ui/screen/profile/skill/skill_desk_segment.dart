import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/bloc/profile/pro_cubit.dart';
import 'package:rro_web/utils/colors.dart';
import 'package:rro_web/utils/texts.dart';

import '../../../widgets/minor_ui.dart';
import '../../../widgets/space.dart';

class SkillDeskSegment extends StatelessWidget {
  const SkillDeskSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var skill = context.watch<ProCubit>().model.skill;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleSegment("Skill"),
        Space.vMedium,
        Space.vMedium,
        _buildItemSegment("Programming Language", skill.proLang),
        Space.vMedium,
        _buildItemSegment("Tools", skill.tools),
        Space.vMedium,
        _buildItemSegment("Other Skill", skill.otherSkill)
      ],
    );
  }

  _buildItemSegment(String subTitle, List<String> item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_right,
              color: systemPrimaryColor,
              size: 15.sp,
            ),
            Expanded(
              child: Text(
                subTitle,
                style: contentPrimaryBold.copyWith(fontSize: 14.sp),
              ),
            )
          ],
        ),
        Space.vSmall,
        Padding(
          padding: EdgeInsets.only(left: 15.sp),
          child: Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: item.map<Widget>((e) => _buildItem(e)).toList(),
          ),
        )
      ],
    );
  }

  _buildItem(String title) {
    return Container(
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
      child: Text(
        title,
        style: contentBold.copyWith(color: systemWhiteColor),
      ),
    );
  }
}
