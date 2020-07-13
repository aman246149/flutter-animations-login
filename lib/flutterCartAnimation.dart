import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartAnimation extends StatefulWidget {
  @override
  _CartAnimationState createState() => _CartAnimationState();
}

class _CartAnimationState extends State<CartAnimation>  with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController=AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),

    );

    animation=Tween(begin: 0.0,end: -0.15).animate(CurvedAnimation(
      curve: Curves.ease,parent: animationController
    ));


    animationController.addListener(() {
      setState(() {

      });
    });

//    animationController.forward();



  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return   Scaffold(
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  height: 350,
                  width: 350,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        elevation: 7.0,
                          child: Text("Buy",style: TextStyle(color: Colors.white),),
                        onPressed: ()
                        {

                        },
                        color: Colors.blue,
                      ),

                      SizedBox(
                        width: 20,
                      ),

                      RaisedButton(
                        elevation: 7.0,
                        child: Text("cancel",style: TextStyle(color: Colors.white),),
                        onPressed: ()
                        {

                        },
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: GestureDetector(
                  onTap: () {
                    animationController.forward();
                  },
                  onDoubleTap: () {
                    animationController.reverse();
                  },
                  child: Container(
                    height: 350,
                    width: 350,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/4499900/pexels-photo-4499900.jpeg?cs=srgb&dl=woman-in-black-tank-top-4499900.jpg&fm=jpg"),
                        )
                    ),
                    transform: Matrix4.translationValues(0.0, animation.value*width, 0.0),
                  ),
                ),
              )

            ],
          ),

        );
      },

    );
  }
}
