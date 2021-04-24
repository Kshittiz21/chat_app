import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance // there is always one
            // active instance of firebase managed on our behalf
            // using which we can execute methods:
            .collection('chats/03W8nBQbWfr9JHX6YwxQ/messages')
            // this is the path to our collections
            .snapshots(), //It allows us to setup a listener
        // through the Firebase Flutter SDK to our Firebase
        // Database. Whenever data changes, this listener is
        // modified automatically and we can listen using
        // .listen() method
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chats/03W8nBQbWfr9JHX6YwxQ/messages')
                .add({
              'text': 'This was added by clicking the button',
            });
          }),
    );
  }
}
