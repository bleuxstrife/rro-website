import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/bloc/profile/pro_cubit.dart';
import 'package:rro_web/ui/widgets/space.dart';

import '../../../../utils/texts.dart';
import '../../../widgets/minor_ui.dart';

class InfoSegment extends StatelessWidget {
  final bool isDesktop;
  const InfoSegment({Key? key, this.isDesktop = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var info = context.watch<ProCubit>().model;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleSegment("Information", isDesktop: isDesktop),
        isDesktop ? Space.vLarge : Space.vMedium,
        _standardBuildItemRow(labelText: "Full Name", contentText: info.name),
        Space.vSmall,
        _standardBuildItemRow(
            labelText: "Place & Date Birth", contentText: info.placeDateBirth),
        Space.vSmall,
        _standardBuildItemRow(labelText: "Gender", contentText: info.gender),
        Space.vSmall,
        _standardBuildItemRow(
          labelText: "Religion",
          contentText: info.religion,
        ),
        Space.vSmall,
        _standardBuildItemRow(
          labelText: "Marital Status",
          contentText: info.maritalStatus,
        ),
        Space.vSmall,
        _standardBuildItemRow(
          labelText: "Residence",
          contentText: info.residence,
        )
      ],
    );
  }

  _standardBuildItemRow(
      {required String labelText, required String contentText}) {
    var style = isDesktop ? null : contentPrimary.copyWith(fontSize: 17.sp);
    return standardBuildItemRow(
      labelText: labelText,
      contentText: contentText,
      styleLabel: style,
      styleContent: style,
      flexLabel: 1,
      flexContent: 2,
      enableSeparator: true,
    );
  }
}
