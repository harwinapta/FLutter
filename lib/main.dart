import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:iot/value.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: desain(),
      theme: ThemeData(
          primaryColor: Colors.amber, primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData.dark(),
    );
  }
}

class desain extends StatefulWidget {
  @override
  State<desain> createState() => _desainState();
}

class _desainState extends State<desain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/walpaper.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              FlutterLogo(
                size: 400,
                style: FlutterLogoStyle.horizontal,
                textColor: Colors.black87,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.red)),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => hasil()));
                },
                child: Text(
                  'CHECK HERE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
