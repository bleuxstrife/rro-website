import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rro_web/model/state/general_state.dart';

class BaseCubit extends Cubit<GeneralState> {
  BaseCubit() : super(const Idle());

  refresh() {
    emit(const Loading());
    emit(const Loaded());
  }
}
