
// import 'we.dart';
// import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'util/sound.dart';
import 'startGame.dart';
// import 'package:flutter/foundation.dart';
void main() async {
  //  WidgetsFlutterBinding.ensureInitialized();
//  if (!kIsWeb) {
//     await Flame.device.setLandscape();
//     await Flame.device.fullScreen();
//   }
  // final myGame = AudioGame();
//await Audio.initialize(); 

  runApp( 

 MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Normal',
      ),
      home: const WelcomePage(),

  ));
}



    
    
