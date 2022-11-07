import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel(
      {required String name,
      @JsonKey(name: "place_date_birth") required String placeDateBirth,
      required String residence,
      required String gender,
      required String religion,
      @JsonKey(name: "marital_status") required String maritalStatus,
      required SkillModel skill,
      @Default([]) List<EduModel> education}) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class EduModel with _$EduModel {
  factory EduModel(
      {@JsonKey(name: "place_study") required String placeStudy,
      required String degree,
      required String location,
      String? gpa,
      required String year}) = _EduModel;

  factory EduModel.fromJson(Map<String, dynamic> json) =>
      _$EduModelFromJson(json);
}

@freezed
class SkillModel with _$SkillModel {
  factory SkillModel({
    @JsonKey(name: "programming_language") @Default([]) List<String> proLang,
    @Default([]) List<String> tools,
     @JsonKey(name: "other_skill")@Default([]) List<String> otherSkill,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
}
