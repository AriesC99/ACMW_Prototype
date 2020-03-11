//import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flash_chat/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final _firestore = Firestore.instance;
// FirebaseUser loggedinUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  String messageText;
  String emailKey = "_email_key";
  String passKey = "_pass_key";

  @override
  void initState() {
    super.initState();
    //getCurrentUser();
  }

  // void removeDetails() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   preferences.remove(emailKey);
  //   preferences.remove(passKey);
  // }

  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser();

  //     if (user != null) {
  //       loggedinUser = user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // _auth.signOut();
              // removeDetails();
              // Navigator.pushReplacementNamed(context, LoginScreen.id);
              //Navigator.pop(context);
            },
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              //decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      controller: messageTextController,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        messageText = value;
                      },
                      //decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      // if (messageText != null) {
                      //   messageTextController.clear();
                      //   _firestore
                      //       .collection('messages')
                      //       .document(Timestamp.now().toDate().toString())
                      //       .setData({
                      //     'sender': loggedinUser.email,
                      //     'text': messageText,
                      //    });
                      //   messageText = null;
                      // }
                    },
                    child: Text(
                      'Send',
                      //style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //   stream: _firestore.collection('messages').snapshots(),
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           backgroundColor: Colors.lightBlueAccent,
    //         ),
    //       );
    //     }

    //     final messages = snapshot.data.documents.reversed;
    //     List<MessageBubble> messageBubbles = [];

    //     for (var message in messages) {
    //       final messageText = message.data['text'];
    //       final messageSender = message.data['sender'];
    //       final currentUser = loggedinUser.email;

    //       final messageBubble = MessageBubble(
    //         sender: messageSender,
    //         text: messageText,
    //         isMe: currentUser == messageSender,
    //       );

    //       messageBubbles.add(messageBubble);
    //     }

    //     return Expanded(
    //       child: ListView(
    //         reverse: true,
    //         padding: EdgeInsets.symmetric(
    //           vertical: 20,
    //           horizontal: 10,
    //         ),
    //         children: messageBubbles,
    //       ),
    //     );
    //   },
    // );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
