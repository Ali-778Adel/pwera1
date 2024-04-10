import 'dart:ui';
import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomProductDesign extends StatefulWidget {
   bool isLarge;
  CustomProductDesign({super.key,required this.isLarge});
  @override
  State<CustomProductDesign> createState() {
    return CustomProductDesignState();
  }
}

class CustomProductDesignState extends State<CustomProductDesign>
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

  final List<String> products=[
    "products/Picture1.png",
    "products/Picture2.png",
    "products/Picture3.png",
    "products/Picture4.png",
    "products/Picture1.png",
    "products/Picture2.png",
    "products/Picture3.png",
    "products/Picture4.png",
    "products/Picture1.png",
    "products/Picture2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: CustomScrollView(slivers: [
        SliverAnimatedGrid(
            itemBuilder: (context, index, animation) {
              // Wrap the item with MouseRegion to detect hover events
              return ItemDesign(
                    imagePath: products[index],
              );
            },
            initialItemCount: 10,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.isLarge?4:2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: widget.isLarge?1.0:.5))
      ]),
    );
  }
}




class ItemDesign extends StatefulWidget {
  final String imagePath;
  const ItemDesign({Key? key,required this.imagePath}) : super(key: key);

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
            decoration:const  BoxDecoration(
              image: DecorationImage(image: AssetImage('dots.png'),fit: BoxFit.fill),

              borderRadius: BorderRadius.all(Radius.circular(15)),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Image.asset(widget.imagePath,fit: BoxFit.contain,colorBlendMode:BlendMode.clear,)),
                const SizedBox(height: 8,),
                const  Divider(
                  color: Colors.grey, // You can set the color of the divider
                  thickness: 2, // You can adjust the thickness of the divider
                  indent: 8, // You can set the left indentation of the divider
                  endIndent: 20, // You can set the right indentation of the divider
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child:  Text("Watanya 2T Power",style: TextStyle(
                      fontFamily: "Nunito-Bold.ttf",
                      fontSize: 16
                  ),),
                ),
                const SizedBox(height: 4,),

                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("192:00 EGP",style: TextStyle(
                      fontFamily: "Nunito-Bold.ttf",fontWeight: FontWeight.bold,
                      fontSize: 16
                  )),
                ),
              ],
            ),
          ).asGlass(),
        ),
      ),
    );
  }
}



