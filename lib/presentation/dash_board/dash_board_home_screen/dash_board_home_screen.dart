import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:power/presentation/core_widgets/core_background.dart';

import '../companies/comapny_home_view.dart';
import '../seperated_custom_widgets/custom_ExpansionTile.dart';
import '../seperated_custom_widgets/custom_list_tile.dart';
import 'dash_board_view.dart';

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({super.key});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  late CustomPageController _pageController;
  late SideMenuController _sideMenuController;

  final List<Widget> dashboardViews = [
    const DashBoardView(),
    const CompaniesHomeView(),
    const Scaffold(
      backgroundColor: Colors.red,
    ),
    const Scaffold(
      backgroundColor: Colors.black,
    ),
  ];

  @override
  void initState() {
    _sideMenuController = SideMenuController();
    _pageController = CustomPageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CoreBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            children: [
              SideMenu(
                // controller: controller,
                minWidth: 220,
                maxWidth: 260,
                backgroundColor: Colors.transparent,
                builder: (data) => SideMenuData(
                  header: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'PowerA1',
                        textStyle: const TextStyle(
                            fontSize: 32.0,
                            height: 2,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito-SemiBold.ttf"),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 1000),
                    // displayFullTextOnTap: true,
                    // stopPauseOnTap: false,
                  ),
                  // items: [SideMenuItemTile(isOpen: isOpen, minWidth: minWidth, data: data)],
                  customChild: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomDashboardListTile(
                          onItemTapped: () {
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.bounceInOut);
                          },
                          children: false,
                          expansionTileIcon: Icons.dashboard,
                          title: "DashBoard",
                          childrens: [],
                        ),
                        CustomDashboardListTile(
                          children: false,
                          expansionTileIcon: Icons.point_of_sale_outlined,
                          title: "Companies",
                          onItemTapped: () {
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.bounceInOut);
                          },
                          childrens: const [],
                        ),
                        CustomDashboardListTile(
                          children: true,
                          expansionTileIcon: Icons.local_gas_station,
                          title: "stations",
                          onItemTapped: () {
                            print("????");
                          },
                          childrens: const [
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                          ],
                        ),
                        CustomDashboardListTile(
                          children: true,
                          onItemTapped: () {
                            print("????");
                          },
                          expansionTileIcon: Icons.production_quantity_limits,
                          title: "Products",
                          childrens:const [
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                          ],
                        ),
                        CustomDashboardListTile(
                          children: true,
                          onItemTapped: () {
                            print("????");
                          },
                          expansionTileIcon: Icons.brightness_auto,
                          title: "Brands",
                          childrens:const [
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                          ],
                        ),
                        CustomDashboardListTile(
                          children: true,
                          onItemTapped: () {
                            print("????");
                          },
                          expansionTileIcon: Icons.shop_2_sharp,
                          title: "Shops",
                          childrens:const [
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                          ],
                        ),
                        CustomDashboardListTile(
                          children: true,
                          onItemTapped: () {
                            print("????");
                          },
                          expansionTileIcon:
                              Icons.supervised_user_circle_outlined,
                          title: "Station\nEmployees",
                          childrens:const [
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                          ],
                        ),
                        CustomDashboardListTile(
                          onItemTapped: () {
                            print("????");
                          },
                          children: true,
                          expansionTileIcon: Icons.local_gas_station,
                          title: "Loyality",
                          childrens:const [
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                            CustomListTile(
                              title: "title",
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  footer: const Text('version 1.0.0'),
                ),
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                // scrollBehavior: ScrollBehavior().copyWith(physics: ScrollPhysics(parent:S)),
                clipBehavior: Clip.antiAliasWithSaveLayer,

                children: dashboardViews,
                onPageChanged: (indx) {},
              )),
            ],
          ),
        ),
      ],
    );
  }
}






class CustomPageController extends PageController {
  CustomPageController({
    initialPage = 0,
    keepPage = true,
    viewportFraction = 1.0,
  }) : super(
          initialPage: initialPage,
          keepPage: keepPage,
          viewportFraction: viewportFraction,
        );

  @override
  void jumpTo(double value) {
    // Do nothing to prevent jumps
  }

  @override
  Future<void> animateToPage(int page,
      {required Duration duration, required Curve curve}) {
    // TODO: implement animateToPage
    return super.animateToPage(page,
        curve: Curves.linearToEaseOut,
        duration: const Duration(milliseconds: 500));
  }
}
