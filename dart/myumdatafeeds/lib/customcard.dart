import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
final String img;
final String title;
final String body;

const CustomCard(this.img,  this.title,  this.body, {super.key});



  @override
  State<CustomCard> createState() => _CustomCard();
}

class _CustomCard extends State<CustomCard>{
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(padding: EdgeInsets.all(16),
      child:Image.network(widget.img, height: 200, width: 300),),
        Expanded(child: Column(children: <Widget>[
         Text(widget.title, 
         textAlign: TextAlign.left,
         style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
        Text(widget.body)],
        )
      )],);
  }}

