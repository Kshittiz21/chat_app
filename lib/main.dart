import 'package:chat_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// We could have called firebase.initializeApp() here or in initState() inside 
// the class where we are using Firebase but this is a better option because in
// the other one, we will get an error screen for 1 sec bcoz the screen will
// try to load without Firebase.initializeApp() called and hence error will occur

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
    );
  }
}
