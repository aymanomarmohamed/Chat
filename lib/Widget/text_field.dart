import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  textfield({required this.OnChange,
    required this.hintTexts,required this.labels,
    required this.labelicons,this.ObscureText=false});
String  hintTexts;
   String  labels;
   IconData  labelicons;

   Function(String) ? OnChange;
bool ObscureText=false;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText: ObscureText,
      validator: (data) {
        if(data!.isEmpty)
        {
          return "field is rerecord";
        }
      },
      onChanged: OnChange,
      decoration: InputDecoration(
        
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(labels,style: TextStyle(
                  color: Colors.white,fontSize: 15
              )),Icon(labelicons,color: Colors.white, )
            ],
          ),
          hintText:hintTexts,
          hintStyle:TextStyle(color: Colors.white60,fontSize: 15),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,

              )
          )
      ),
    );
  }
}
