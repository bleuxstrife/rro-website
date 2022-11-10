import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  factory ProjectModel(
      {required String name,
      required String desc,
      @Default([]) List<String> tools,
      @Default([]) List<String> gallery,
      @JsonKey(name: "github_url") String? githubUrl,
      @JsonKey(name: "play_store_url") String? playStoreUrl,
      @JsonKey(name: "app_store_url") String? appStoreUrl,
      @JsonKey(name: "website_url") String? websiteURl}) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
