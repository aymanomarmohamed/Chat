import 'package:chat/const.dart';
import 'package:chat/model/massages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Widget/ChatBuble.dart';
import '../Widget/ChatBuble.dart';

class ChatPage extends StatelessWidget {
   CollectionReference messages =
   FirebaseFirestore.instance.collection(kMessagesCollections);
static String id = "ChatPage";
   TextEditingController controller = TextEditingController();
   ScrollController _controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    String email =ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>
      (stream: messages.orderBy(KTime, descending:true ).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: kPrimaryColors,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(klogo, height: 60,)
                      , Text("Chat",style: TextStyle(
                          fontSize: 28,
                          fontFamily: "Pacifico",
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
                body:Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return
                            messagesList[index].id == email? ChatBuble(message: messagesList[index]):
                            ChatBubleForFriend(message: messagesList[index]);
                           })),


    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (value) {
                          messages.add(
                              {
                                kMessage:value,
                                KTime:DateTime.now(),
                                'id':email
                              });

                          controller.clear();
                          _controller.animateTo(
                             0, duration:Duration(seconds: 4), curve: Curves.bounceInOut);

                        },
                        decoration: InputDecoration(suffixIcon: Icon(Icons.send,color: kPrimaryColors),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: kPrimaryColors,

                                )
                            )
                        ),
                      ),
                    )
                  ],
                )
            );
          }
          else
          {
            return Text("Loading.....");
          }
        },);
  }
}
