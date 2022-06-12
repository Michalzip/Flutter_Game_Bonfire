import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'dart:math';
import 'dart:ui';
import 'ui_hero.dart';



class InterFaceInGame extends GameInterface
{
 onLoad(){
 add(HealthBar());
super.onLoad();
  }
}
