import 'package:flutter/material.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});
  @override
  State<DashBoardView> createState() {
    return DashBoardViewState();
  }
}

class DashBoardViewState extends State<DashBoardView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 100,
        ),
        animationBehavior: AnimationBehavior.normal);
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: CustomScrollView(slivers: [
        SliverAnimatedGrid(
            itemBuilder: (context, index, animation) {
              // Wrap the item with MouseRegion to detect hover events
              return ItemDesign(

              );
            },
            initialItemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.0))
      ]),
    );
  }
}




class ItemDesign extends StatefulWidget {
  const ItemDesign({Key? key}) : super(key: key);

  @override
  _ItemDesignState createState() => _ItemDesignState();
}

class _ItemDesignState extends State<ItemDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _animation=Tween<double>(begin: -0.0008, end: 0.0008).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            );
            _animationController.forward(from: 0.0);
            _animationController.repeat();

          });

        },
        onExit: (_){
          setState(() {
            _animation = Tween<double>(begin: 0.0, end: 0.0).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            );
            _animationController.reverse(from: 0.0);
          });
        },
        child: RotationTransition(
          turns: _animation,
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.deepOrange,
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                  offset: Offset(-2, -2),
                )
              ],
              color: Colors.purple,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: RadialGradient(
                tileMode: TileMode.mirror,
                stops: [.2, .2],
                center: Alignment.bottomRight,
                colors: [Colors.deepOrangeAccent, Colors.transparent],
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(
                    Icons.local_gas_station,
                    size: 42,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 8,
                  child: const Text(
                    "5",
                    style: TextStyle(
                      fontFamily: "Nunito-SemiBold.ttf",
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 8,
                  child: const Text(
                    "Companies",
                    style: TextStyle(
                      fontFamily: "Nunito-SemiBold.ttf",
                      fontSize: 20,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 24,
                  right: 8,
                  child: Icon(Icons.bar_chart_sharp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



