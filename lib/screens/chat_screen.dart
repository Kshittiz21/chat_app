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
          // We also need to import firebase_core.dart file b/c 
          // before using any firebase core products we need to 
          // Firebase.initializeApp(); and it returns future.
          FirebaseFirestore.instance // there is always one
          // active instance of firebase managed on our behalf
          // using which we can execute methods:
              .collection('chats/03W8nBQbWfr9JHX6YwxQ/messages')
              // this is the path to our collections
              .snapshots() //It allows us to setup a listener 
              // through the Firebase Flutter SDK to our Firebase
              // Database. Whenever data changes, this listener is
              // modified automatically
              .listen((data) {
            // using listen we are listening to changes
            data.docs.forEach((document) {
              // it executes on every document in our collection
              print(document['text']);
            });
            //print(data.docs[0]['text']);
          });
        },
      ),
    );
  }
}
