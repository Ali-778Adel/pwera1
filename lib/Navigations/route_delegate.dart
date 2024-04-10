import 'package:flutter/material.dart';
import 'package:power/Navigations/route_pathes.dart';
import 'package:power/presentation/landing_page/landing_age.dart';
import '../presentation/dash_board/dash_board_home_screen/dash_board_home_screen.dart';

class MyRouteDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  MyRoutePath selectedPath = const MyRoutePath.home();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouteDelegate():navigatorKey=GlobalKey<NavigatorState>();

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,

      pages: [
        if (selectedPath.isHomePage)
          MaterialPage(
              key: const ValueKey("homePage"),
              child: LandingPage(
                myRouteDelegate: this,
              )),
        if (selectedPath.isPage)
          const MaterialPage(
              key: ValueKey("dashboard"), child: DashboardHomeScreen())
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        notifyListeners();
        return true;
      },
    );
  }

  void goToDashboard() {
    selectedPath = const MyRoutePath.page();
    notifyListeners();
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // setRestoredRoutePath(MyRoutePath.page());

    print("........................................");

    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    if (configuration.isHomePage) {
      selectedPath = const MyRoutePath.home();
    } else if (configuration.isPage) {
      selectedPath = const MyRoutePath.page();
    }
  }

  @override
  MyRoutePath get currentConfiguration => selectedPath;
}
