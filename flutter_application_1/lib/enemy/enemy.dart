import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'ConfigEnemy.dart';
import '/util/sound.dart';
import 'package:bonfire/bonfire.dart';

import 'package:flutter/cupertino.dart';

class PinkEnemy extends SimpleEnemy with AutomaticRandomMovement ,ObjectCollision 
{
  bool letsMovmentEnemy=true;
  PinkEnemy(Vector2 position):super
  (
width:40,
position:position,
life:100,
//Vector2(430,500),
height:40,
animation:MovmentEnemy()
  ){

setupCollision
(
  CollisionConfig(collisions: [CollisionArea.rectangle(size: const Size(30,30))])
);
  }
  
@override
void render(Canvas canvas)
{
drawDefaultLifeBar(
      canvas,
      borderRadius: BorderRadius.circular(2),
    );
super.render(canvas);
}

@override
  void update(double dt){
if(letsMovmentEnemy){
seePlayer(
        radiusVision:80,
        observed: (player) {
   
          followComponent(
            player,
            dt,
            closeComponent: (comp) {
               atack();
            },
          );
        },
        notObserved: () {
          runRandomMovement(
            dt,
            speed: 50,
        
            maxDistance: 120
          );
        },
      );
}
  super.update(dt);
}

void atack(){
simpleAttackMelee(
  damage:10,
  height:30,
  width: 30,
  animationRight:SpriteAnimation.load("enemy/fightRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32))),
  animationLeft:SpriteAnimation.load("enemy/fightLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32))),
  animationDown:SpriteAnimation.load("enemy/fightBottom.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32))),
  animationUp:SpriteAnimation.load("enemy/fightTop.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32))),
interval :400,
sizePush: 50
);
}
@override
 void receiveDamage(double damage, dynamic from) {

Audio.hitEnemy();
showDamage(damage,config:TextStyle(color:Colors.redAccent,fontSize:25));

super.receiveDamage(damage,from);
 }

    @override
    void die() {
    removeFromParent();

gameRef.add(
 AnimatedObjectOnce(position:position,animation:SpriteAnimation.load("enemy/enemyDead.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32))))
  
);
Audio.deathEnemySound();
      super.die();
    }

}





