import 'package:freezed_annotation/freezed_annotation.dart';

import '../network_exception/network_exception.dart';

part 'general_state.freezed.dart';

@freezed
class GeneralState with _$GeneralState {
  const factory GeneralState.idle() = Idle;

  const factory GeneralState.loaded() = Loaded;

  const factory GeneralState.loading() = Loading;

  const factory GeneralState.error(
      {NetworkException? error, String? errorMsg}) = Error;
}
