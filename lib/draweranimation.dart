import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrawerFlutter extends StatefulWidget {
  @override
  _DrawerFlutterState createState() => _DrawerFlutterState();
}

class _DrawerFlutterState extends State<DrawerFlutter> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;

  final double moveright=238.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController=AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200)
    );

  }

  void toggle()
  {
    animationController.isDismissed?animationController.forward():animationController.reverse();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,

      builder: (context, child) {

        double slide=moveright*animationController.value;
        double scale=1-(animationController.value*0.3);

        return SafeArea(
          child: Scaffold(
            body: Stack(
            children: <Widget>[
              Container(
                color: Color(0xff121847),
                child: Padding(
                  padding: const EdgeInsets.only(top:88.0,left: 10),
                  child: ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage("https://images.pexels.com/photos/4499900/pexels-photo-4499900.jpeg?cs=srgb&dl=woman-in-black-tank-top-4499900.jpg&fm=jpg"),
                            radius: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Aman",style: TextStyle(color: Colors.white,fontSize: 29),),
                        ],
                      ),
                      SizedBox(height: 80,),

                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,color: Colors.white,size: 25,
                          ),

                          SizedBox(width: 35,),
                          Text("Search",style: TextStyle(color: Colors.white,fontSize: 25),)
                          
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),


                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.comment,color: Colors.white,size: 25,
                          ),
                          SizedBox(width: 35,),
                          Text("meassage",style: TextStyle(color: Colors.white,fontSize: 25),)

                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),


                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.gamepad,color: Colors.white,size: 25,
                          ),
                          SizedBox(width: 35,),
                          Text("game",style: TextStyle(color: Colors.white,fontSize: 25),)

                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),


                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,color: Colors.white,size: 25,
                          ),
                          SizedBox(width: 35,),
                          Text("give money",style: TextStyle(color: Colors.white,fontSize: 25),)

                        ],
                      ),

                      SizedBox(
                        height: 80,
                      ),


                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.settings,color: Colors.white,size: 25,
                          ),
                          SizedBox(width: 35,),
                          Text("Setting",style: TextStyle(color: Colors.white,fontSize: 25),)

                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.all_inclusive,color: Colors.white,size: 25,
                          ),
                          SizedBox(width: 35,),
                          Text("support",style: TextStyle(color: Colors.white,fontSize: 25),)

                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),

              ),
              Transform(
                transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
                alignment: Alignment.centerLeft,

                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)
                  ),

                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: toggle,
                            child: Icon(
                              Icons.menu,color: Colors.black,size: 30,
                            ),
                          ),
                        ),
                      ),

                      Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        elevation: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 500,
                            width: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Dawn to sunrise",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black),),
                      )
                    ],
                  )

                ),
              ),

            ],
            ) ,
          ),
        );
      },

    );
  }
}
