import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.red,
                  Colors.purple,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

        SafeArea(
          child: Container(
              width: 200,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage('https://scontent.fdac5-1.fna.fbcdn.net/v/t1.6435-9/107611066_2633754206865937_8000927186616442412_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=d3zONzo3-08AX9lWH4G&_nc_ht=scontent.fdac5-1.fna&oh=00_AT-TVlqzPaU4PT_SN516YwoGVUHCGPPWlzfDHfBfFybjVQ&oe=61E0CF95'),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'Mohammad Ali Khan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            ),
                          ),
                          
                      ],
                    ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: (){},
                            leading: Icon(Icons.home,color: Colors.white,),
                            title: Text('Home',style: TextStyle(color: Colors.white),),
                            ),
                            ListTile(
                            onTap: (){},
                            leading: Icon(Icons.person,color: Colors.white,),
                            title: Text('Person',style: TextStyle(color: Colors.white),),
                            ),
                            ListTile(
                            onTap: (){},
                            leading: Icon(Icons.settings,color: Colors.white,),
                            title: Text('Settings',style: TextStyle(color: Colors.white),),
                            ),
                            ListTile(
                            onTap: (){},
                            leading: Icon(Icons.logout,color: Colors.white,),
                            title: Text('Log Out',style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                ],
              ),
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0,end: value), 
          duration: Duration(milliseconds:500), 
          curve: Curves.easeOutCubic,
          builder: (_, double val, __){
            return(Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 200 * val)
                ..rotateY((pi/6) * val),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('3D Animated navigation drawer'),
                  ),
                  body: Center(
                    child: Text('Swipe right or click to open the menu ->'),
                  ),
                ),
               )
              );
          },
        ),

        GestureDetector(
          // onTap: (){
          //   setState(() {
          //     value == 0? value = 1: value = 0;
          //   });
          // },
          onHorizontalDragUpdate: (e){
            if(e.delta.dx > 0){
              setState(() {
                value = 1;
              });
            }else{
              setState(() {
                value = 0;
              });
            }
          },
        ),

      ],
     ),
    );
  }
}
