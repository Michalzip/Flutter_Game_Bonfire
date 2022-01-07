import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

import 'dart:async';

  class AnimationPlayer{


 static Future<SpriteAnimation>left= SpriteAnimation.load("player/idleLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime:  0.2, textureSize: Vector2(20,20)));
 static Future<SpriteAnimation>right= SpriteAnimation.load("player/idleRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime:0.2, textureSize: Vector2(20,20)));
 static Future<SpriteAnimation>rightRun= SpriteAnimation.load("player/runRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime:0.1, textureSize: Vector2(20,20)));
 static Future<SpriteAnimation>leftRun= SpriteAnimation.load("player/runLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime:0.1, textureSize: Vector2(20,20)));

 static Future<SpriteAnimation>animationRight= SpriteAnimation.load("player/FightRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime:0.1,textureSize: Vector2(20,20)));
 static Future<SpriteAnimation>animationLeft= SpriteAnimation.load("player/FightLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime:0.1,textureSize: Vector2(20,20)));
 static Future<SpriteAnimation>deadPlayer=SpriteAnimation.load("player/playerDead.png",SpriteAnimationData.sequenced(amount: 3, stepTime:0.1,textureSize:Vector2(20,20)));

}


class ConfigPlayer extends SimpleDirectionAnimation
{ 





 ConfigPlayer():super
(
  runLeft:  AnimationPlayer.leftRun,
  idleRight: AnimationPlayer.right,
  idleLeft: AnimationPlayer.left,
  runRight: AnimationPlayer.rightRun
)
{

  playOnce(AnimationPlayer.deadPlayer);

}


}
