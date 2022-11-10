import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/bloc/project/project_cubit.dart';
import 'package:rro_web/model/project/project_model.dart';
import 'package:rro_web/ui/widgets/space.dart';
import 'package:rro_web/utils/colors.dart';
import 'package:rro_web/utils/texts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../model/state/general_state.dart';
import '../../widgets/circular_loading.dart';

class ProjectDeskScreen extends StatefulWidget {
  const ProjectDeskScreen({Key? key}) : super(key: key);

  @override
  State<ProjectDeskScreen> createState() => _ProjectDeskScreenState();
}

class _ProjectDeskScreenState extends State<ProjectDeskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ProjectCubit, GeneralState>(
              builder: (context, state) => state.maybeWhen(
                  loaded: () => SingleChildScrollView(
                        child: _buildContent(context),
                      ),
                  orElse: () => const Center(
                        child: CircularLoading(),
                      )),
            )));
  }

  Widget _buildContent(BuildContext context) {
    var list = context.watch<ProjectCubit>().projectList;
    return ResponsiveGridRow(
        children: list
            .map<ResponsiveGridCol>((e) => _builditem(context, e))
            .toList());
  }

  _builditem(BuildContext context, ProjectModel model) {
    return _responsiveGridCol(Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: systemPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: contentWhiteBold,
                ),
                Space.hSmall,
                Expanded(child: _buildUrl(context, model))
              ],
            ),
            Space.vMedium,
            Text(
              model.desc,
              style: contentWhite,
            ),
            Space.vMedium,
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: model.tools.map<Widget>((e) => _buildTools(e)).toList(),
            )
          ],
        )));
  }

  _buildTools(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: systemPrimaryColor,
              blurRadius: 10,
              spreadRadius: 0.01,
              offset: const Offset(3, 3),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          color: systemWhiteColor),
      child: Text(
        title,
        style: contentPrimary.copyWith(fontSize: 11.sp),
      ),
    );
  }

  _responsiveGridCol(Widget child) {
    return ResponsiveGridCol(
      xl: 4,
      sm: 12,
      md: 6,
      child: child,
    );
  }

  _buildUrl(BuildContext context, ProjectModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildItemURL(
            model.gallery.isNotEmpty,
            Icons.image,
            () => context
                .read<ProjectCubit>()
                .showGallery(context, model.gallery)),
        _buildItemURL(model.websiteURl != null, Icons.web,
            () => launchUrlString(model.websiteURl!)),
        _buildItemURL(model.appStoreUrl != null, Icons.apple,
            () => launchUrlString(model.appStoreUrl!)),
        _buildItemURL(model.playStoreUrl != null, Icons.android,
            () => launchUrlString(model.playStoreUrl!))
      ],
    );
  }

  _buildItemURL(bool isAvailable, IconData iconData, Function onPressed) {
    return Visibility(
      visible: isAvailable,
      child: Row(
        children: [
          Space.hSmall,
          InkWell(
            onTap: () => onPressed(),
            child: Icon(
              iconData,
              size: 15.sp,
              color: systemWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
