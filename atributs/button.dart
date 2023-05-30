import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

button(String txt,double fs, double width, double height, Function onTap){
  return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 145, 16, 1),
                Color.fromRGBO(251, 214, 115, 1)
              ]),
          borderRadius: BorderRadius.circular(8)),
      child: ElevatedButton(
        onPressed: () {
          onTap;
        },
        child: Text(txt, style: TextStyle(fontSize: fs),),
        style: ElevatedButton.styleFrom(
          elevation: 0,
            minimumSize: Size(width, height),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )),
      ),
    );
}