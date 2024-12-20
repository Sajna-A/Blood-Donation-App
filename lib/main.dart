import 'dart:async';

import 'package:blood_donation/SCREENS/Adduser.dart';
import 'package:blood_donation/SCREENS/Update.dart';
import 'package:blood_donation/SCREENS/homepage.dart';
import 'package:blood_donation/SCREENS/sample.dart';
import 'package:blood_donation/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Use platform-specific options
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        // '/test': (context) => Test(),
        '/': (context) => HomePage(),
        '/add': (context) => AddUser(),
        '/update': (context) => UpdateDonor(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
