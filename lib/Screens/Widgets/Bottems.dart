import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Models/Constants.dart';
import 'package:news/Screens/Views/Category_News.dart';

class Button extends StatelessWidget {

  String type;
  var color;
//dynamic asmaa;
  Button({required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RaisedButton(
        onPressed: (){

        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) { return Category(Category11: type,);}));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: color,
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: largfont),
        ),
      ),
    );
  }
}
