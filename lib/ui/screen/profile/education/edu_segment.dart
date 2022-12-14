import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/bloc/profile/pro_cubit.dart';
import 'package:rro_web/model/profile/profile_model.dart';
import 'package:rro_web/ui/widgets/minor_ui.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/texts.dart';
import '../../../widgets/space.dart';

class EduSegment extends StatelessWidget {
  final bool isDesktop;
  const EduSegment({Key? key, this.isDesktop = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.watch<ProCubit>().model.education;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleSegment("Education", isDesktop: isDesktop),
        isDesktop ? Space.vMedium : Space.vSmall,
        Column(
          children: _itemList(list),
        )
      ],
    );
  }

  List<Widget> _itemList(List<EduModel> list) {
    List<Widget> children = [];
    for (int i = 0; i < list.length; i++) {
      children.add(_timeLine(
          isFirst: i == 0,
          isLast: i == list.length - 1,
          endChild: _endChild(list[i])));
    }
    return children;
  }

  Widget _timeLine(
      {bool isFirst = false,
      bool isLast = false,
      IndicatorStyle? indicatorStyle,
      Widget? startChild,
      Widget? endChild}) {
    return TimelineTile(
        afterLineStyle: LineStyle(color: systemPrimaryColor),
        beforeLineStyle: LineStyle(color: systemPrimaryColor),
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: indicatorStyle ??
            IndicatorStyle(width: isDesktop ? 13.sp : 14.sp, color: systemPrimaryColor),
        startChild: startChild,
        endChild: endChild,
        alignment: TimelineAlign.start);
  }

  Widget _endChild(EduModel model) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.year,
            style: smallContentPrimary.copyWith(fontSize: isDesktop ? 10.sp : 14.sp),
          ),
          Space.vSmallest,
          Text(
            model.degree,
            style: contentPrimaryBold.copyWith(fontSize: isDesktop ? 13.sp : 17.sp),
          ),
          Space.vSmallest,
          Text(
            model.placeStudy,
            style: contentPrimaryBold.copyWith(fontSize: isDesktop ? 12.sp : 16.sp),
          ),
          Space.vSmallest,
          Visibility(
            visible: model.gpa != null,
            child: Text(
              "GPA : ${model.gpa}",
              style: contentPrimary.copyWith(fontSize: isDesktop ? 12.sp : 16.sp),
            ),
          )
        ],
      ),
    );
  }
}
