import 'package:flutter/material.dart';

void Snkebar(context,String data){

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));

}




