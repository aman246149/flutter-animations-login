import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;
  Animation animationleft;
  Animation<Offset> offset;
  Animation<Offset> offset2;

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation=Tween<double>(begin: 1,end: 0).animate(CurvedAnimation(
      parent: animationController,curve: Curves.fastOutSlowIn
    ));

    animationleft=Tween<double>(begin: -1,end: 0).animate(CurvedAnimation(
        parent: animationController,curve: Curves.fastOutSlowIn
    ));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(CurvedAnimation(parent: animationController,curve: Curves.fastLinearToSlowEaseIn));

    offset2=Tween<Offset>(begin: Offset(0.0,1.0),end: Offset.zero).animate(CurvedAnimation(parent: animationController,curve: Curves.fastLinearToSlowEaseIn));




   animationController.addListener(() {
     setState(() {
     });
   });


//   animationController.addStatusListener((status) {
//     if(status==AnimationStatus.completed)
//       {
//         animationController.reverse();
//       }
//     else if(status==AnimationStatus.dismissed)
//       {
//         animationController.forward();
//       }
//   });

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context,Widget child)
      {
        return  Scaffold(

          body: Center(
              child: Padding(
                padding: const EdgeInsets.all(58.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    SlideTransition(
                      position: offset2,
                      child: Stack(
                        children: <Widget>[
                          Container(

                            child: Text("HELLO",style: TextStyle(fontSize: 68,fontWeight: FontWeight.bold,color: Colors.green),),
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 68,bottom: 30),
                            child: Text("DEVELOPERS",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green),),
                          ),
                        ],
                      ),
                    ),
                    
                    Transform(
                      transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                    ),

                    SizedBox(height: 20,),

                    Transform(
                      transform: Matrix4.translationValues(animationleft.value*width, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                    ),

                    SizedBox(height: 40.0),
                    Transform(
                      transform: Matrix4.translationValues(animationleft.value*width, 0.0, 0.0),

                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot passward",
                          style: TextStyle(
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),

                    SlideTransition(
                      position: offset,
                      child: Center(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),

        );
      }

    );
  }
}
