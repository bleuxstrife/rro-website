import 'package:rro_web/bloc/base/base_cubit.dart';
import 'package:rro_web/model/experience/exp_model.dart';
import 'package:rro_web/utils/json_converter.dart';

class ExpCubit extends BaseCubit {
  List<ExpModel> _expList = [];

  init() async {
    _expList = await JsonConverter.getExpModel();
    refresh();
  }

  List<ExpModel> get expList => _expList;
}
