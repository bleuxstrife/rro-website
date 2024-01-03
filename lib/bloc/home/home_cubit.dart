import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/bloc/base/base_cubit.dart';
import 'package:rro_web/constant/dashboard_constant.dart';
import 'package:rro_web/model/contact/contact_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../gen/assets.gen.dart';
import '../../utils/colors.dart';

class HomeCubit extends BaseCubit {
  List<ContactModel> get getAllContact {
    final size = Device.screenType == ScreenType.desktop ? 15.sp : 18.sp;
    return [
      ContactModel(
          name: "Github",
          icon: Assets.images.icGithub.svg(
              colorFilter: ColorFilter.mode(systemWhiteColor, BlendMode.srcIn),
              width: size,
              height: size),
          onClicked: () => launchUrlString(githubUrl)),
      ContactModel(
          name: "Phone",
          icon: Icon(
            Icons.phone,
            size: size,
            color: systemWhiteColor,
          ),
          onClicked: () => launchUrlString(telUrl)),
      ContactModel(
          name: "Whatsapp",
          icon: Assets.images.icWa.svg(
              colorFilter: ColorFilter.mode(systemWhiteColor, BlendMode.srcIn),
              width: size,
              height: size),
          onClicked: () => launchUrlString(whatsappUrl)),
      ContactModel(
          name: "Email",
          icon: Icon(
            Icons.email,
            size: size,
            color: systemWhiteColor,
          ),
          onClicked: () => launchUrlString(emailUrl)),
      ContactModel(
          name: "CV",
          icon: Icon(
            Icons.file_copy,
            size: size,
            color: systemWhiteColor,
          ),
          onClicked: () => launchUrlString(cvUrl)),
    ];
  }
}
