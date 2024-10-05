import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Widget/butomwidwet.dart';
import '../Widget/text_field.dart';
import '../const.dart';
import '../helper/snakebar.dart';
import 'ChatPage.dart';
import 'Login.dart';
class register extends StatefulWidget {
    static String id="register";

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
    String  ?email;

    String ? password;

    GlobalKey<FormState>FormKey=GlobalKey();

    bool isloding=false;

    @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloding,

      child: Scaffold(

        backgroundColor: kPrimaryColors,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: FormKey,
            child: ListView(

              children: [
                SizedBox(
                  height: 95,
                ),

                Image.asset("assets/image/scholar.png",
                height: 100),


                Center(
                  child: Text("My Chat",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Pacifico",
                        color: Colors.white
                    ),
                  ),
                ),

                Row(
                  children: [
                    Text("Resgister",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                textfield(
                  OnChange: (data){
                    email=data;

                  },
                  hintTexts: "Enter Your Email",
                  labelicons:Icons.email,labels:"Email",

                ),
                SizedBox(
                  height: 24,
                ),

                textfield(
                    ObscureText: true,
                  OnChange: (data){
                    password=data;

                  },
                  hintTexts: "Enter Your Password",
                  labelicons:Icons.lock,labels:"password",
                ),
                SizedBox(
                  height:33 ,
                ),
                boutomwidwet(OnTap: () async {
                   if (FormKey.currentState!.validate()) {
                     isloding=true;
                     setState(() {

                     });
                     try {
                      await registerfierbass();
                      Navigator.pushNamed(context, ChatPage.id,arguments: email);

                     } on FirebaseAuthException catch (e) {
                      if (e.code=='weak-password')
                        {

                          Snkebar(context,"weak-password");
                        }
                      else if (e.code=='email-already-in-use'){
                        Snkebar(context,"email-already-in-use");



                      }}
                     isloding=false;
                     setState(() {

                     });
                   }




                },
                  text:"Register" ,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " have a account ? ",style: TextStyle(
                        fontSize: 18,color: Colors.white
                    ),
                    ),
                    GestureDetector(
                      onTap:() {
                        Navigator.pop(context);
                      },
                      child: Text(
                          "Login",style: TextStyle(
                          fontSize: 18,color: Color(0xffC7EDE6)
                      )),
                    )
                    ,
                  ],
                ),

              ],


            ),
          ),
        ),

      ),
    );
    ;
  }



    Future<void> registerfierbass() async {
       var auth=FirebaseAuth.instance;
      UserCredential User=await
      auth.createUserWithEmailAndPassword(email: email!, password: password!);
    }
}
