import 'dart:developer';

import 'package:chat/Pages/ChatPage.dart';
import 'package:chat/Pages/register.dart';
import 'package:chat/Widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Widget/butomwidwet.dart';
import '../const.dart';
import '../helper/snakebar.dart';

class Login extends StatefulWidget {
  static String id="LoginPage";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
String? Email,Password;

bool isloding=false;
GlobalKey<FormState>FormKey=GlobalKey();

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
                height: 100,
                ),
                Center(
                  child: Text("My Chat",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Pacifico",
                    color: Colors.white
                  ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Text("Login",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 24,
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
                    Email=data;
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
Password=data;
              },
              hintTexts: "Enter Your Password",
              labelicons:Icons.lock,labels:"password",
            ),
                SizedBox(
                  height:33 ,
                ),
                boutomwidwet(OnTap: () async {
                  isloding=true;
                  setState(() {

                  });
                  if (FormKey.currentState!.validate()) {
                    try {
                      await loginfierbass();
                      Navigator.pushNamed(context, ChatPage.id,arguments: Email);
                    } on FirebaseAuthException catch (e)  {
                      if (e.code =="invalid-credential")
                      {
                      //  Navigator.pop(context);
                        Snkebar(context,"user-not-found");
                      }
                      else if (e.code=='wrong-password'){
                        Snkebar(context,"wrong-password");
                    
                    
                    
                      }
                      else {
                        log(e.code);
                        Snkebar(context,e.toString());
                    
                      }
                    
                    }
                  }
       
                  isloding=false;
                  setState(() {

                  });

                },


        text: "login",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "dont have an account ? ",style: TextStyle(
                      fontSize: 18,color: Colors.white
                    ),
                    ),
                    GestureDetector(
                      onTap:() {
                        Navigator.pushNamed(context, register.id);
                          },
                      child: const Text(
                        "Register",style: TextStyle(
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
  }

Future<void> loginfierbass() async {
  var auth=FirebaseAuth.instance;
  UserCredential User=await
  auth.signInWithEmailAndPassword(email: Email!, password: Password!);
}
}
