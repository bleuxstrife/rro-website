import 'package:rro_web/bloc/base/base_cubit.dart';
import 'package:rro_web/model/profile/profile_model.dart';

import '../../utils/json_converter.dart';

class ProCubit extends BaseCubit {
  late ProfileModel _model;

  init() async {
    _model = await JsonConverter.getProModel();
    refresh();
  }

  ProfileModel get model => _model;
}
