import 'package:flutter/material.dart';
import 'package:rro_web/bloc/base/base_cubit.dart';
import 'package:rro_web/model/project/project_model.dart';
import 'package:rro_web/ui/widgets/gallery.dart';
import 'package:rro_web/utils/json_converter.dart';

class ProjectCubit extends BaseCubit {
  List<ProjectModel> _projectList = [];

  init(BuildContext context) async {
    _projectList = await JsonConverter.getProjectModel(context);
    refresh();
  }

  showGallery(BuildContext context, List<String> image) {
    return showDialog(
        context: context, builder: (context) => Gallery(imagePath: image,));
  }

  List<ProjectModel> get projectList => _projectList;
}
