import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';
import 'package:flutter/material.dart';
import 'package:rro_web/bloc/base/base_cubit.dart';
import 'package:rro_web/constant/dashboard_constant.dart';
import 'package:rro_web/ui/screen/experience/exp_desk_screen.dart';
import 'package:rro_web/ui/screen/profile/pro_desk_screen.dart';
import 'package:rro_web/ui/screen/project/project_desk_screen.dart';

class DashCubit extends BaseCubit {
  int _index = DashMenuConstant.home;

  _setIndex(int index) {
    _index = index;
    refresh();
  }

  Widget get child {
    Widget child = Container();
    switch (_index) {
      case DashMenuConstant.home:
        child = Container();
        break;
      case DashMenuConstant.about:
        child = const ProDeskScreen();
        break;
      case DashMenuConstant.exp:
        child = const ExpDeskScreen();
        break;
      case DashMenuConstant.project:
        child = const ProjectDeskScreen();
        break;
    }

    return child;
  }

  List<CollapsibleItem> get items {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () => _setIndex(0),
        isSelected: _index == DashMenuConstant.home,
      ),
      CollapsibleItem(
        text: 'About',
        icon: Icons.person,
        onPressed: () => _setIndex(1),
        isSelected: _index == DashMenuConstant.about,
      ),
      CollapsibleItem(
        text: 'Experience',
        icon: Icons.work_history,
        onPressed: () => _setIndex(2),
        isSelected: _index == DashMenuConstant.exp,
      ),
      CollapsibleItem(
        text: 'Project',
        icon: Icons.folder,
        onPressed: () => _setIndex(3),
        isSelected: _index == DashMenuConstant.project,
      ),
    ];
  }
}
