import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text('This Works!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Firebase.initializeApp();
          FirebaseFirestore.instance
              .collection('chats/03W8nBQbWfr9JHX6YwxQ/messages')
              .snapshots()
              .listen((data) {
            data.docs.forEach((document) {
              print(document['text']);
            });
            //print(data.docs[0]['text']);
          });
        },
      ),
    );
  }
}
