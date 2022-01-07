import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';


class AnimationEnemies
{
static Future<SpriteAnimation> idleLeft=SpriteAnimation.load("enemy/idleLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(32,32)));
static Future<SpriteAnimation> idleRight=SpriteAnimation.load("enemy/idleRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(32,32)));
static Future<SpriteAnimation> runLeft=SpriteAnimation.load("enemy/runLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(32,32)));
static Future<SpriteAnimation> runRight=SpriteAnimation.load("enemy/runRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(32,32)));
static Future<SpriteAnimation> fightRight=SpriteAnimation.load("enemy/fightRight.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(32,32)));
static Future<SpriteAnimation> fightLeft=SpriteAnimation.load("enemy/fightLeft.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32)));
static Future<SpriteAnimation> fightTop=SpriteAnimation.load("enemy/fightTop.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32)));
static Future<SpriteAnimation> fightBottom=SpriteAnimation.load("enemy/fightBottom.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(32,32)));

}




class MovmentEnemy extends SimpleDirectionAnimation 
{

MovmentEnemy():super
(
idleLeft:AnimationEnemies.idleLeft,
runLeft:AnimationEnemies.runLeft,
idleRight:AnimationEnemies.idleRight,
runRight:AnimationEnemies.runRight,

);

}