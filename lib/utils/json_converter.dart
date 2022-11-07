import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rro_web/model/experience/exp_model.dart';
import 'package:rro_web/model/profile/profile_model.dart';

class JsonConverter {
  static Future<List<ExpModel>> getExpModel(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("json/exp.json");
    var map = jsonDecode(data) as List;
    return map.map<ExpModel>((e) => ExpModel.fromJson(e)).toList();
  }

  static Future<ProfileModel> getProModel(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("json/profile.json");
    var map = jsonDecode(data);
    return ProfileModel.fromJson(map);
  }
}
