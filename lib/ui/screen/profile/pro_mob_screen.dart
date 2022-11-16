import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rro_web/ui/screen/profile/education/edu_segment.dart';
import 'package:rro_web/ui/widgets/minor_ui.dart';
import 'package:rro_web/ui/widgets/space.dart';

import '../../../bloc/profile/pro_cubit.dart';
import '../../../model/state/general_state.dart';
import '../../widgets/circular_loading.dart';
import 'information/info_segment.dart';
import 'skill/skill_segment.dart';

class ProMobScreen extends StatefulWidget {
  const ProMobScreen({Key? key}) : super(key: key);

  @override
  State<ProMobScreen> createState() => _ProMobScreenState();
}

class _ProMobScreenState extends State<ProMobScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: standardAppBar("Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ProCubit, GeneralState>(
          builder: (context, state) => state.maybeWhen(
              loaded: () => SingleChildScrollView(
                    child: _buildContent(),
                  ),
              orElse: () => const Center(
                    child: CircularLoading(),
                  )),
        ),
      ),
    );
  }

  _buildContent() {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            InfoSegment(
              isDesktop: false,
            ),
            Space.vMedium,
            EduSegment(
              isDesktop: false,
            ),
            Space.vMedium,
            SkillSegment(
              isDesktop: false,
            ),
          ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
