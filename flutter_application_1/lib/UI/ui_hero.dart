import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'dart:math';
import 'dart:ui';


class HealthBar extends InterfaceComponent 
{
  double life = 120;
  double strokeWidth = 15.8;
  HealthBar():super(id: 1,sprite:Sprite.load("health_ui.png") ,height:26,width:130,position:Vector2(20,20));


@override
 render(Canvas canvas) {
super.render(canvas);
drawHealth(canvas);
 }


 update(double dt){
if(gameRef.player!=null){
  life=gameRef.player?.life ?? 0.0;
}
 super.update(dt);
}

void drawHealth(Canvas canvas,){
  double p1=position.left+26;
  double p2=position.top+12;
  
canvas.drawLine(
Offset(p1,p2),
Offset(p1+life,p2),
Paint()
..color=Colors.green[800]!
..strokeWidth = strokeWidth
  
);
}
}

