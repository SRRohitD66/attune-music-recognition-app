import 'package:flutter/material.dart';
import 'constants.dart';



class BottomButton extends StatelessWidget {
  BottomButton({required this.press,required this.name});
  final Function press;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        press();

      },
      child: Container(

        child: Center(child: Text(name,style: klargeButtonText)),
        color: Colors.blueAccent,
        margin: EdgeInsets.only(bottom: 0),
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        padding: EdgeInsets.only(bottom: 20,top: 10),
      ),
    );
  }
}