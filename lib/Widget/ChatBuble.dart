import 'package:chat/const.dart';
import 'package:flutter/material.dart';

import '../model/massages.dart';

class ChatBuble extends StatelessWidget {
   ChatBuble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8
        ),

        padding: EdgeInsets.only(left: 16,
        bottom: 16,
        top: 16,right: 16),

        decoration: BoxDecoration(
          color: kPrimaryColors,
          borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)
          )
        ),
        child: Text(message.message,style: TextStyle(
          color: Colors.white
        ),
        ),
        
      ),
    )
      ;
  }
}

class ChatBubleForFriend extends StatelessWidget {
  ChatBubleForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8
        ),

        padding: EdgeInsets.only(left: 16,
            bottom: 16,
            top: 16,right: 16),

        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32)
            )
        ),
        child: Text(message.message,style: TextStyle(
            color: Colors.white
        ),
        ),

      ),
    )
    ;
  }
}