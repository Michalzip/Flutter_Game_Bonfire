import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';


class NextMap extends GameDecoration with Sensor
{
  

  final String id;
  bool hasContact = false;

  final ValueChanged<String> exitMap;
  
   static Future<Sprite> potion =  Sprite.load('c.png',
                  srcPosition: Vector2(0, 0),
                  srcSize: Vector2(0,0)
               );
NextMap

(

  
   this.id,Vector2 position, double width, double height, this.exitMap
)

      : super.withSprite(
           NextMap.potion,//we dont need that
          position: position,
          width: width,
          height: height,
        );


   
   
   @override

    void onContact(GameComponent component) {
   
     if(!hasContact && component is Player){
 
      hasContact=true;
  
      exitMap(id);

     }

    }

}

extension BuildContextExtensions on BuildContext {
  Future goTo(Widget page) {
    return Navigator.pushAndRemoveUntil(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (Route<dynamic> route) => false,
    );
  }
}
