import 'package:flutter/material.dart';



class DeadWidget{

 static  showGameOver(BuildContext context, VoidCallback playAgain) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/deadImage.jpg',
                height: 100,
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.transparent,
                onPressed: playAgain,
                child: Text(
                'Play Again',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Normal',
                      fontSize: 20.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  



}