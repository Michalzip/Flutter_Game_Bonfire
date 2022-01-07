import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import '/Player.dart';
import '/util/sound.dart';
import 'package:bonfire/bonfire.dart';

import 'package:flutter/cupertino.dart';

class Old_man_animations
{
static Future<SpriteAnimation> idleLeft=SpriteAnimation.load("Boss/idleLeft.png",SpriteAnimationData.sequenced(amount: 2, stepTime: 0.2, textureSize: Vector2(46,46)));
static Future<SpriteAnimation> idleRight=SpriteAnimation.load("Boss/idleRight.png",SpriteAnimationData.sequenced(amount:2, stepTime: 0.2, textureSize: Vector2(46,46)));
static Future<SpriteAnimation> runLeft=SpriteAnimation.load("Boss/runLeft.png",SpriteAnimationData.sequenced(amount: 2, stepTime: 0.2, textureSize: Vector2(46,46)));
static Future<SpriteAnimation> runRight=SpriteAnimation.load("Boss/runRight.png",SpriteAnimationData.sequenced(amount: 2, stepTime: 0.2, textureSize: Vector2(46,46)));
static Future<SpriteAnimation> fightRight=SpriteAnimation.load("Boss/fightRight.png",SpriteAnimationData.sequenced(amount: 2, stepTime: 0.2, textureSize: Vector2(46,46)));
static Future<SpriteAnimation> fightLeft=SpriteAnimation.load("Boss/fightLeft.png",SpriteAnimationData.sequenced(amount: 2, stepTime: 0.2, textureSize: Vector2(46,46)));
static Future<SpriteAnimation> fightTop=SpriteAnimation.load("Boss/fightTop.png",SpriteAnimationData.sequenced(amount: 2, stepTime: 0.2, textureSize: Vector2(46,46)));
static Future<SpriteAnimation> fightBottom=SpriteAnimation.load("Boss/fightBottom.png",SpriteAnimationData.sequenced(amount: 2, stepTime: 0.2, textureSize: Vector2(46,46)));


}


class Movment_Old_Man extends SimpleDirectionAnimation {

Movment_Old_Man():super
(

idleLeft:Old_man_animations.idleLeft,
runLeft:Old_man_animations.idleRight,
idleRight:Old_man_animations.idleRight,
runRight:Old_man_animations.runRight,


);

}

class Old_man extends SimpleEnemy with AutomaticRandomMovement,ObjectCollision
{
    bool letsMovmentEnemy=true;
  Old_man(Vector2 position):super
  (
width:60,
position:position,
life:100,
//Vector2(430,500),
height:60,
animation:Movment_Old_Man(),
  ){


    setupCollision
(
  CollisionConfig(collisions: [CollisionArea.rectangle(size: const Size(30,36))])
);
  }

@override

void render(Canvas canvas)
{


drawDefaultLifeBar(
      canvas,
      borderRadius: BorderRadius.circular(2),
    );


//void drawDefaultLifeBar(canvas.drawLine(Offset(20,20), Offset(20,20), Paint()));

super.render(canvas);

}
@override

  void update(double dt){

if(letsMovmentEnemy){
 

seePlayer(
        radiusVision:170,
        
        observed: (player) {
           print("player");
           atackRange();
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
             runOnlyVisibleInCamera: true ,
            maxDistance: 70
          );
        },
      );
}
  super.update(dt);




}


void atackRange(){

simpleAttackRange
(
  animationDestroy:SpriteAnimation.load("Boss/explosion_fire.png",SpriteAnimationData.sequenced(amount: 3,stepTime:0.1,textureSize:
  Vector2(64,64))) ,
  animationUp:  SpriteAnimation.load("Boss/fireballTop.png",SpriteAnimationData.sequenced(amount: 2,stepTime:0.1,textureSize:
  Vector2(64,64))),
  animationDown:SpriteAnimation.load("Boss/fireballBottom.png",SpriteAnimationData.sequenced(amount: 2,stepTime:0.1,textureSize:
  Vector2(64,64))),
  animationLeft: SpriteAnimation.load("Boss/fireballLeft.png",SpriteAnimationData.sequenced(amount: 3,stepTime:0.1,textureSize:
  Vector2(64,64))),
  animationRight: SpriteAnimation.load("Boss/fireballRight2.png",SpriteAnimationData.sequenced(amount: 3,stepTime:0.1,textureSize:
  Vector2(64,64))),
  width:20,
  height:20,
  lightingConfig: LightingConfig(radius: 15,color:Colors.deepOrangeAccent.withOpacity(0.5))
);

}


void atack(){
simpleAttackMelee(
  damage:10, 
  height:30,
  width: 30,
  animationRight:SpriteAnimation.load("enemy/fightRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(64,64))),
  animationLeft:SpriteAnimation.load("enemy/fightLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(64,64))),
  animationDown:SpriteAnimation.load("enemy/fightBottom.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(64,64))),
  animationUp:SpriteAnimation.load("enemy/fightTop.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(64,64))),
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
  

 AnimatedObjectOnce(position:position,animation:SpriteAnimation.load("Boss/enemyDead.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(46,46))))

);
Audio.deathEnemySound();


      super.die();
    }



}