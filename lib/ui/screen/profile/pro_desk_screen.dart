import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rro_web/bloc/profile/pro_cubit.dart';
import 'package:rro_web/model/state/general_state.dart';
import 'package:rro_web/ui/screen/profile/education/edu_desk_segment.dart';
import 'package:rro_web/ui/screen/profile/information/info_desk_segment.dart';
import 'package:rro_web/ui/screen/profile/skill/skill_desk_segment.dart';
import 'package:rro_web/ui/widgets/circular_loading.dart';
import 'package:rro_web/ui/widgets/space.dart';

class ProDeskScreen extends StatefulWidget {
  const ProDeskScreen({Key? key}) : super(key: key);

  @override
  State<ProDeskScreen> createState() => _ProDeskScreenState();
}

class _ProDeskScreenState extends State<ProDeskScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildVerticalSeg()),
        Space.hMedium,
        Expanded(child: _buildEduSeg())
      ],
    );
  }

  _buildEduSeg() {
    return const EduDeskSegment();
  }

  _buildVerticalSeg() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        InfoDeskSegment(),
        Space.vMedium,
        Space.vMedium,
        SkillDeskSegment()
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
