import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rro_web/model/experience/exp_model.dart';
import 'package:rro_web/model/profile/profile_model.dart';
import 'package:rro_web/model/project/project_model.dart';

class JsonConverter {
  static Future<List<ExpModel>> getExpModel() async {
    String data =
        await rootBundle.loadString("assets/json/exp.json");
    var map = jsonDecode(data) as List;
    return map.map<ExpModel>((e) => ExpModel.fromJson(e)).toList();
  }

  static Future<ProfileModel> getProModel() async {
    String data =
        await rootBundle.loadString("assets/json/profile.json");
    var map = jsonDecode(data);
    return ProfileModel.fromJson(map);
  }

  static Future<List<ProjectModel>> getProjectModel() async {
    String data =
        await rootBundle.loadString("assets/json/project.json");
    var map = jsonDecode(data) as List;
    return map.map<ProjectModel>((e) => ProjectModel.fromJson(e)).toList();
  }
}
