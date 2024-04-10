import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomDashboardListTile extends StatefulWidget {
  final bool children;
  final IconData expansionTileIcon;
  final String title;
  final void Function()? onItemTapped;
  final List<Widget> childrens;

  const CustomDashboardListTile(
      {super.key,
        required this.childrens,
        required this.children,
        required this.title,
        required this.onItemTapped,
        required this.expansionTileIcon});

  @override
  State<CustomDashboardListTile> createState() => CustomDashBoardListTileState();
}

class CustomDashBoardListTileState extends State<CustomDashboardListTile> {
  late bool isActive;
  late ExpansionTileController controller;
  Color hoverColor = Colors.transparent;
  Color selectedColor = Colors.transparent;

  CustomDashBoardListTileState() : super();

  @override
  void initState() {
    controller = ExpansionTileController();
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            spreadRadius: 5.0,
            blurRadius: 4.0,
            blurStyle: BlurStyle.outer,
            color: Colors.white10)
      ]),
      child: InkWell(
        enableFeedback: true,
        onTap: widget.onItemTapped,
        onDoubleTap: widget.onItemTapped,
        onHover: (isHovered) {
          hoverColor = Colors.purple;
        },
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        hoverDuration: const Duration(milliseconds: 0),
        hoverColor: Colors.purple,
        child: widget.children
            ? ExpansionTile(
          iconColor: Colors.black,
          controller: controller,
          childrenPadding:
          const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
          shape: Border.all(color: Colors.transparent, width: 0.0),
          collapsedShape:
          Border.all(color: Colors.transparent, width: 0.0),
          leading: Icon(
            widget.expansionTileIcon,
          ),
          trailing: Visibility(
              visible: widget.children,
              child: IconButton(
                // highlightColor: Colors.transparent,
                // hoverColor: Colors.transparent,
                icon: Icon(isActive
                    ? Icons.keyboard_arrow_down_sharp
                    : Icons.keyboard_arrow_left_sharp),
                onPressed: () {
                  setState(() {
                    isActive = !isActive;
                    isActive
                        ? controller.expand()
                        : controller.collapse();
                  });
                },
              )),
          title: AnimatedTextKit(
            onTap: (){
              setState(() {
                isActive = !isActive;
                isActive
                    ? controller.expand()
                    : controller.collapse();
              });
            },
            animatedTexts: [
              TypewriterAnimatedText(
                widget.title,
                textStyle: const TextStyle(
                    fontSize: 20.0,
                    height: 1,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Nunito-Regular.ttf"),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 1000),
            // displayFullTextOnTap: false,
            // isRepeatingAnimation: false,
            // stopPauseOnTap: true,
          ),
          children: widget.childrens,
        )
            : ListTile(
          leading: Icon(widget.expansionTileIcon),
          title: AnimatedTextKit(
            onTap: widget.onItemTapped,
            animatedTexts: [
              TypewriterAnimatedText(
                widget.title,
                textStyle: const TextStyle(
                    fontSize: 20.0,
                    height: 1,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Nunito-Regular.ttf"),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 1000),
            // displayFullTextOnTap: false,
            // isRepeatingAnimation: false,
            // stopPauseOnTap: true,
          ),
        ),
      ),
    );
  }
}
