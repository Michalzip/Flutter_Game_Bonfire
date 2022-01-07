

import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'util/sound.dart';

import 'configPlayer.dart';

import 'endWidget.dart';
import 'map1.dart';
class MyPlayer extends SimplePlayer with ObjectCollision,Lighting{

MyPlayer(Vector2 position):super(
  position: position,
  animation:ConfigPlayer(),
  width: 40,
  height: 40,
  life: 100,
  
  speed:150
  
  
  ){

setupLighting(LightingConfig(radius: width * 0.7 , color:  Colors.transparent));
setupCollision(

CollisionConfig(collisions:[CollisionArea.rectangle(size: const Size(30,39))])

);




  
  }

 @override
  void joystickAction(JoystickActionEvent event){


    if(event.event==ActionEvent.DOWN){

      execAtack();
    }

  }


  void execAtack(){

Audio.meleAtackPlayer();
    simpleAttackMelee
    (
      animationUp:SpriteAnimation.load("player/atackUp.png",
      SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize:Vector2(32,32))),
      animationDown:SpriteAnimation.load("player/atackDown.png",
      SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize:Vector2(32,32))),
      animationLeft: 
      SpriteAnimation.load("player/atackLeft.png",
      SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize:Vector2(32,32)))
      ,
      animationRight:
      SpriteAnimation.load("player/atackRight.png",
      SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize:Vector2(32,32))) ,
      damage:20,
     // id:1,

    );
  }



void receiveDamage(double damage, dynamic from) {


showDamage(damage,config:TextStyle(color:Colors.red[800]));
super.receiveDamage(damage, from);
  }

  

  void die(){
removeFromParent();
 if(life==0){
gameRef.add(
AnimatedObjectOnce(position:position,animation:SpriteAnimation.load("player/playerDead.png",SpriteAnimationData.sequenced(amount: 3, stepTime:0.1,textureSize:Vector2(20,20))))
);   
Audio.backgroundMusicStop();
Audio.playerDead();

DeadWidget.showGameOver(context, () {
          Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Game()),
          (Route<dynamic> route) => false,
        ); });

 }
 
super.die();

  }

}  
