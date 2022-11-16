import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../bloc/experience/exp_cubit.dart';
import '../../../model/experience/exp_model.dart';
import '../../../model/state/general_state.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import '../../widgets/circular_loading.dart';
import '../../widgets/minor_ui.dart';
import '../../widgets/space.dart';

class ExpMobScreen extends StatefulWidget {
  const ExpMobScreen({Key? key}) : super(key: key);

  @override
  State<ExpMobScreen> createState() => _ExpMobScreenState();
}

class _ExpMobScreenState extends State<ExpMobScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
       appBar: standardAppBar("Experience"),
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<ExpCubit, GeneralState>(
        builder: (context, state) => state.maybeWhen(
            loaded: () => ListView(
                  children: _itemList(context.watch<ExpCubit>().expList),
                ),
            orElse: () => const Center(child: CircularLoading())),
      ),
    ));
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
            IndicatorStyle(width: 13.sp, color: systemPrimaryColor),
        startChild: startChild,
        endChild: endChild,
        alignment: TimelineAlign.manual,
        lineXY: 0.2);
  }

  List<Widget> _itemList(List<ExpModel> list) {
    List<Widget> children = [];
    children.add(
        _timeLine(indicatorStyle: _pointIndicator("June 2016"), isFirst: true));
    for (var e in list) {
      children.add(_timeLine(endChild: _endChild(e)));
    }
    children.add(
        _timeLine(indicatorStyle: _pointIndicator("Dec 2022"), isLast: true));
    return children;
  }

  Widget _endChild(ExpModel model) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      width: 5.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.company,
            style: expCompanyLabel.copyWith(fontSize: 18.sp),
          ),
          Text(
            model.position,
            style: expPositionLabel.copyWith(fontSize: 17.sp),
          ),
          Space.vSmall,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${model.startDate} - ${model.endDate}",
                style: contentPrimary.copyWith(fontSize: 16.sp),
              ),
              Space.hSmall,
              Icon(
                Icons.date_range,
                color: systemPrimaryColor,
                size: 16.sp,
              )
            ],
          ),
          Space.vSmall,
          Column(
            children: [
              for (int i = 0; i < model.tasks.length; i++)
                _buildItemTask(model.tasks[i])
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItemTask(String task) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "-",
          style: contentPrimary.copyWith(fontSize: 16.sp),
        ),
        Space.hSmall,
        Expanded(
            child: Text(
          task,
          style: contentPrimary.copyWith(fontSize: 16.sp),
        ))
      ]),
    );
  }

  IndicatorStyle _pointIndicator(String contentText) {
    return IndicatorStyle(
      width: 25.w,
      height: 5.h,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      drawGap: true,
      indicator: Container(
        decoration: BoxDecoration(
            color: systemPrimaryColor,
            border: Border.all(color: systemPrimaryColor, width: 4),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            contentText,
            style: indicatorStart.copyWith(fontSize: 18.sp),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
