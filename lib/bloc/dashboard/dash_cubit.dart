import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';
import 'package:flutter/material.dart';
import 'package:rro_web/bloc/base/base_cubit.dart';
import 'package:rro_web/constant/dashboard_constant.dart';
import 'package:rro_web/ui/screen/experience/exp_desk_screen.dart';
import 'package:rro_web/ui/screen/experience/exp_mob_screen.dart';
import 'package:rro_web/ui/screen/home/home_mob_screen.dart';
import 'package:rro_web/ui/screen/profile/pro_desk_screen.dart';
import 'package:rro_web/ui/screen/project/project_screen.dart';
import '../../ui/screen/home/home_desk_screen.dart';
import '../../ui/screen/profile/pro_mob_screen.dart';

class DashCubit extends BaseCubit {
  int _index = DashMenuConstant.home;

  late int _currentPageSelected;
  late List<Widget> _pages;
  late PageController _pageController;

  initMobile() {
    _initPages();
    _initPageController();
    refresh();
  }

  _initPageController() {
    _currentPageSelected = 0;
    _pageController = PageController(initialPage: _currentPageSelected);
  }

  _initPages() {
    _pages = [
      const HomeMobScreen(),
      const ProMobScreen(),
      const ExpMobScreen(),
      const ProjectScreen()
    ];
  }

  onTabTapped(int index) {
    _currentPageSelected = index;
    _pageController.jumpToPage(_currentPageSelected);
    refresh();
  }

  _setIndex(int index) {
    _index = index;
    refresh();
  }

  Widget get child {
    Widget child = Container();
    switch (_index) {
      case DashMenuConstant.home:
        child = const HomeDeskScreen();
        break;
      case DashMenuConstant.about:
        child = const ProDeskScreen();
        break;
      case DashMenuConstant.exp:
        child = const ExpDeskScreen();
        break;
      case DashMenuConstant.project:
        child = const ProjectScreen();
        break;
    }

    return child;
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }

  PageController get pageController => _pageController;

  List<Widget> get pages => _pages;

  int get currentPageSelected => _currentPageSelected;

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
