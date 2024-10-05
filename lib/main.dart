import 'package:chat/Pages/ChatPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Pages/Login.dart';
import 'Pages/register.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Chat());
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{ register.id:(context) {
        return register();
      },
        ChatPage.id:(context) => ChatPage(),
        Login.id:(context) => Login()
      },
      home: Login(),
    );
  }
}
