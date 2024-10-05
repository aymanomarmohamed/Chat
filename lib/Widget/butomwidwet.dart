import 'package:flutter/material.dart';

class boutomwidwet extends StatelessWidget {
    boutomwidwet({required this.OnTap,required this .text});
    String text;
    Function() OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
           color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontFamily: "Pacifico"
          ),
          ),
        ),
      ),
    );
  }
}
