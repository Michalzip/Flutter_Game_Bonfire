import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'Player.dart';
import 'UI/ui_game.dart';
import 'enemy/enemy.dart';
import 'light.dart';
import '/boses/old_Man.dart';

class SecondMap extends StatefulWidget {
  const SecondMap({ Key? key }) : super(key: key);

  @override
  _SecondMapState createState() => _SecondMapState();
}

//import 'package:flame_audio/flame_audio.dart';
class _SecondMapState extends State<SecondMap> 
{
  
  bool showGameOver=false;
 GameController? _controller;
JoystickActionEvent w=JoystickActionEvent(id:1,event:ActionEvent.DOWN,intensity: 2.0,radAngle: 5);
 Widget build(BuildContext context) {
return Material(child:

BonfireTiledWidget(
  //showCollisionArea:true,
  gameController: _controller,
  showFPS: true,
    cameraConfig: CameraConfig(
        moveOnlyMapArea: true
      ),
    map: TiledWorldMap(
    'map2/secondMap.json',
    forceTileSize: Size(32,32),
  
    objectsBuilder:{
      //proporties bo bierzemy z tilteda pozycje ktora ustaliismy
      'pinkEnemy':(proporties)=>PinkEnemy(proporties.position),
      'Light':(proporties)=>LighttTorch1(proporties.position),
      "torch":(proporties)=>LighttTorch2(proporties.position),
      'old_man_boss':(proporties)=>Old_man(proporties.position),
    }

  
    ),
    lightingColorGame:Colors.black.withOpacity(0.8),
    interface:InterFaceInGame(),
    joystick: Joystick
    (

keyboardConfig: KeyboardConfig(
          enable: true, 
          keyboardDirectionalType: KeyboardDirectionalType.arrows, 
        ), 

      directional:JoystickDirectional(margin : const EdgeInsets.only(bottom: 95, left: 80)),
      actions:
      [
        JoystickAction(
          actionId: 1,
          sprite:Sprite.load("joystick_atack.png"),
       
          size:76,
          margin: const EdgeInsets.only(bottom: 60, right: 30),
          
         
         
        
          )
      ]
      
    ),
   

    player: MyPlayer(Vector2(430,880)),
  
  )


);

 }

  
}