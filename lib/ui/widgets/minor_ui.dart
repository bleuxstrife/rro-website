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

AppBar standardAppBar(String title,
        {List<Widget>? action,
        bool enableBorder = true,
        bool automaticallyImplyLeading = true,
        bool? centerTitle}) =>
    AppBar(
      title: Text(title),
      backgroundColor: systemWhiteColor,
      foregroundColor: systemPrimaryColor,
      centerTitle: centerTitle ?? true,
      actions: action,
      elevation: 1,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );

Widget titleSegment(String title, {required bool isDesktop}) {
  var titleStyle = isDesktop
      ? contentPrimaryBold.copyWith(fontSize: 16.sp)
      : contentPrimaryBold.copyWith(fontSize: 19.sp);
  var lineWidth = isDesktop ? 15.w : 25.w;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title,
        style: titleStyle,
      ),
      Container(
        width: lineWidth,
        height: 5,
        color: systemPrimaryColor,
      )
    ],
  );
}
