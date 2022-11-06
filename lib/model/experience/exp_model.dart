import 'package:freezed_annotation/freezed_annotation.dart';

part 'exp_model.freezed.dart';
part 'exp_model.g.dart';

@freezed
class ExpModel with _$ExpModel {
  factory ExpModel({
    required String company,
    required String position,
    @JsonKey(name: "start_date") required String startDate,
    @JsonKey(name: "end_date") required String endDate,
    @JsonKey(name: "task") @Default([]) List<String> tasks,
  }) = _ExpModel;

  factory ExpModel.fromJson(Map<String, dynamic> json) =>
      _$ExpModelFromJson(json);
}
