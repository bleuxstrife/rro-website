
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rro_web/constant/dashboard_constant.dart';

part 'contact_model.freezed.dart';


@freezed
class ContactModel with _$ContactModel {
  factory ContactModel({
    required String name,
    required Widget icon,
    required ContactOnClicked onClicked,
  }) = _ContactModel;
}
