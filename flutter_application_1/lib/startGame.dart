import 'package:flutter/material.dart';
import 'map1.dart';
import 'dart:ui'as ui;
class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context){

    
   
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: 
        Column(children: [
    
      SizedBox(height:40),
      Center(child:Text("TRITIO",style:TextStyle(
        fontSize: 40,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
      
        wordSpacing: 20
        
        ))),
      SizedBox(height:5),
      Center(child:  IconButton(
               
           icon:Image.asset("assets/play.png"),
                iconSize: 140,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Game() ),
                  );
                },
              ),
  )

        ],) /* add child content here */,
      ),
    );
  }
}


