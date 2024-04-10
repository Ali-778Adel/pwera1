import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:power/main.dart';
import 'package:power/presentation/core_widgets/customBottomNavigationBar.dart';
import 'package:power/presentation/landing_page/widgets/custom_product_item.dart';
import '../../Navigations/route_delegate.dart';
import '../constatns/Sizer.dart';
import '../core_widgets/core_background.dart';
import '../core_widgets/custom_app_bar.dart';

class LandingPage extends StatefulWidget {
  final MyRouteDelegate myRouteDelegate;

  const LandingPage({super.key, required this.myRouteDelegate});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late ScrollController scrollController;
  TabController? tabController;

  @override
  void initState() {

    scrollController = ScrollController();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool isSmall=false;
  bool isMedium=false;
  bool isLarge=false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth<=Sizer.smallScreenWidth){

           isSmall=true;
           isLarge=false;
           isMedium=false;

        }else if (constraints.maxWidth<=Sizer.mediumScreenWidth){

            isSmall=false;
            isLarge=false;
            isMedium=true;

        }else{

            isSmall=false;
            isLarge=true;
            isMedium=false;

        }
        return Stack(
          children: [
            const CoreBackground(),
            Scaffold(
                backgroundColor: const Color(0xffFEF8F0).withOpacity(20 / 100),
                appBar:
                isLarge
                    ?
                CustomAppBar(index: index,isLarge: isLarge,myRouteDelegate: myRouteDelegate,scrollController: scrollController).call()
                    :
                    null
                ,

                bottomNavigationBar: isSmall||isMedium?const CustomBottomNavigationBar(key: ValueKey('b'),):null,
                body: CustomScrollView(
                  controller: scrollController,
                  semanticChildCount: 3,
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .99,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: MediaQuery.of(context).size.height * 0.27,
                                    right: 0.0,
                                    child: Container(
                                      width:isLarge? 300:100,
                                      height:isLarge ?300:100,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              opacity: .2,

                                              colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.color),
                                              image: ExactAssetImage("fuel.png"))),
                                      child: BackdropFilter(
                                        blendMode: BlendMode.color,
                                        filter:
                                        ImageFilter.blur(sigmaY: 20, sigmaX: 10,tileMode: TileMode.mirror),
                                        child: Container(
                                          color: Colors.white10,
                                        ),
                                      ),
                                    )),
                                Positioned(
                                  top: MediaQuery.of(context).size.height * 0.25,
                                  right: 0.0,
                                  child: Container(

                                    width:isLarge? 300:100,
                                    height:isLarge ?300:100,
                                    // transform: Matrix4.rotationX(20),
                                    color: Colors.transparent,
                                    child: Image.asset(
                                      'fuel.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .99,
                              child:  CustomProductDesign(isLarge: isLarge,)
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .99,
                              child: const Scaffold(
                                backgroundColor: Colors.red,
                              ))
                        ]))
                  ],
                )

            ),

          ],
        );
      },
    );
  }
}
