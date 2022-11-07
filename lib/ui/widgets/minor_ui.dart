import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/colors.dart';
import '../../utils/texts.dart';
import 'space.dart';

standardBuildItemRow(
    {required String labelText,
    required String contentText,
    bool enableSeparator = false,
    Widget separatorSpace = Space.hMedium,
    int flexLabel = 1,
    int flexContent = 1,
    TextStyle? styleLabel,
    TextStyle? styleContent}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
          flex: flexLabel,
          child: Text(
            labelText,
            style: styleLabel ?? contentPrimaryBold.copyWith(fontSize: 14.sp),
          )),
      separatorSpace,
      Visibility(
        visible: enableSeparator,
        child: Text(
          ": ",
          style: styleLabel ?? contentPrimary.copyWith(fontSize: 14.sp),
        ),
      ),
      Expanded(
          flex: flexContent,
          child: Text(
            contentText,
            style: styleContent ?? contentPrimary.copyWith(fontSize: 14.sp),
          )),
    ],
  );
}

  Widget titleSegment(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: contentPrimaryBold.copyWith(fontSize: 16.sp),
        ),
        Container(
          width: 15.w,
          height: 5,
          color: systemPrimaryColor,
        )
      ],
    );
  }
