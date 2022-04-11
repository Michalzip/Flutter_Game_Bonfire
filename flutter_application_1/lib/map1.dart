import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'util/sound.dart';
import 'Player.dart';
import 'NPC/myNPC.dart';
import 'exitmap.dart';
import 'map2.dart';
import 'endWidget.dart';
import 'UI/ui_game.dart';

class Game extends StatefulWidget {
  const Game({ Key? key }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> with WidgetsBindingObserver implements GameListener {
  bool showGameOver=false;
 GameController? _controller;
void initState() {

Audio.backgroundMusicPlay();
  //  Audio.playBackgroundSound();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

     
  return Material(child: BonfireTiledWidget(
    gameController: _controller,
    cameraConfig: CameraConfig(
        moveOnlyMapArea: true
      ),
    map: TiledWorldMap(
    'map/StartMap.json',
    forceTileSize: const Size(32,32),

    objectsBuilder:{
      
      'NPC':(proporties)=>NPC()
    }

  
    )..registerObject('NextMap',(p)=>NextMap
    (
      //id
      'NextMap',
      
       p.position,
       p.size.width,
       p.size.height,
       //NextMap
       (v)=>{exitMap(v,context)}
      
    
    )
    ),
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
         // spriteBackgroundDirection:Sprite.load("bgjoy.png"),
          size:76,
          margin: const EdgeInsets.only(bottom: 60, right: 30),
          align:JoystickActionAlign.BOTTOM_RIGHT,
         
        //enableDirection: true
          
          )
      ]
    ),
    player: MyPlayer(Vector2(500,300)),
  interface:InterFaceInGame(),
  
    )
  
  
  
  );
  
  
  }
void exitMap(String value, BuildContext context){

if (value == 'NextMap') {

 context.goTo(SecondMap());

}

}
  
  void _showDialogGameOver() {
    setState(() {
      showGameOver = true;
      DeadWidget.showGameOver(
      context,
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Game()),
          (Route<dynamic> route) => false,
        );
      },
    );
    });
    
  }

  @override
  void changeCountLiveEnemies(int count) {}

  @override
  void updateGame() {
    if (_controller!.player!.isDead) {
      if (!showGameOver) {
        showGameOver = true;
        return _showDialogGameOver();
      
    }
    }
  }

}
