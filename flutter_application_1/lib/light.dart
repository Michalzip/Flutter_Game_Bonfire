import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:bonfire/bonfire.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'dart:math';
import 'dart:ui';


class LighttTorch1 extends GameDecoration with Lighting  {

LighttTorch1(Vector2 position):super.withSprite(Sprite.load("torch.png"), position: position, height: 63, width: 30)
{
  setupLighting(LightingConfig(radius: width * 1.5 , color:  Colors.deepOrangeAccent.withOpacity(0.3),withPulse: true));


}


 
}
class LighttTorch2 extends GameDecoration with Lighting {


LighttTorch2(Vector2 position):super.withAnimation(SpriteAnimation.load("torch2.png",SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(8,8))), position: position, height: 40, width: 40)
{

 setupLighting(LightingConfig(
   radius: width * 1 ,
    pulseVariation: 0.1,
   withPulse :true, 
   
   //pulseCurve: Curves.easeInOutSine,
  //  color:  Colors.transparent,
   // pulseVariation: 0.1,
        color: Colors.deepOrangeAccent.withOpacity(0.3),
   ));
}

}