import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter_application_1/util/sound.dart';
import 'dart:math';
import 'dart:ui';
import '/Player.dart';


class Anim extends SimpleDirectionAnimation{
static Future<SpriteAnimation> left=SpriteAnimation.load("NPC/idleLeft.png",SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(18,18))); 
static Future<SpriteAnimation> right=SpriteAnimation.load("NPC/idleRight.png",SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(18,18))); 

Anim():super
(
idleLeft:left,
runLeft:left,
idleRight:left,
runRight:left

);

}


//mixiny piszemy z with
class NPC extends SimpleEnemy with ObjectCollision 
{

  bool letsTalking=true;
  NPC():super(position:Vector2(540,50),width:30,height:30,animation:Anim()){
//required Iterable<CollisionArea> wtedy uzywamy [ tutaj bedzie CollisionArea]
setupCollision(

CollisionConfig(collisions:[CollisionArea.rectangle(size: const Size(25,25))])

);

}


@override
void update(double dt){

seePlayer(
  radiusVision:20,
  observed: (player)=>{

   if(letsTalking==true){
    followComponent(
          player,
          dt,
          margin:10,
          closeComponent: (comp) => {
         gameRef.camera.moveToPositionAnimated(
            Offset(
              //pozycja enemy
              position.center.dx,
              position.center.dy,
            ),
            zoom: 2,
            duration: const Duration(seconds:1),
            finish: () {
    
   
    talkDialog();

    
    },
          )
          },
       
        ),
   
    showEmote()
    }
    
    },
    notObserved:(){

        gameRef.camera.moveToPlayerAnimated();
    }
    
  
);




  super.update(dt);
  }

void talkDialog(){
 //gameRef - uzywamy kiedy chcemy dodac cos do naszego intefejus z
 //zawsze  


 Audio.interactionWithNpc();
TalkDialog.show(gameRef.context, 
[
  Say(text: [const TextSpan(text: 'Please Help!'),]),
  
],

);
letsTalking=false;
}

void showEmote(){
//gameRef - odniesienie do bohatera w skypricektorym piszemy
//gameRef jest to instancca bonfire a instyancja to wystepowanie objectow takich jak u nas NPC() A npc to nasz NPC
//instacnja to klasa ktora przechwytuje szczegolne informacje o tej klasie
//gameRef odnosi sie do interfejsu naszej klasy i dodaje za pomoca .add() to co chcemy do interfejsu naszej postaci np  
String potion = "emote/!.png";
//dodaj component do interfeju
gameRef.add(
//animatedfollowerObjecty pozwala na przepisanie animacji do naprzykladi  tak juz animowanego bohatera 
AnimatedFollowerObject(animation:SpriteAnimation.load(potion, SpriteAnimationData.sequenced(amount: 8, stepTime: 0.1, textureSize: Vector2(16,16))),target: this,positionFromTarget: const Rect.fromLTWH(
          18,
          -6,
          12,
          12,
        ).toVector2Rect())

);


}




}