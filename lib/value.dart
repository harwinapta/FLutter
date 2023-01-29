import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class hasil extends StatefulWidget {
  const hasil({super.key});

  @override
  State<hasil> createState() => _hasilState();
}

class _hasilState extends State<hasil> {
  final Future<FirebaseApp> inApp = Firebase.initializeApp();
  DatabaseReference Ref = FirebaseDatabase.instance.ref().child('/KADAR');
  DatabaseReference Refsens =
      FirebaseDatabase.instance.ref().child('/KADAR/GAS');
  DatabaseReference Refstat =
      FirebaseDatabase.instance.ref().child('/KADAR/STATUS');
  String kadarvalue = '0';
  String kondisi = '0';

  @override
  Widget read1() {
    return Container(
      child: Text(
        "GAS CONTENT : $kadarvalue",
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 25,
            fontFamily: 'SpaceMono-bold'),
      ),
    );
  }

  Widget read2() {
    return Container(
      child: Text(
        "STATUS : $kondisi",
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 25,
            fontFamily: 'SpaceMono-bold'),
      ),
    );
  }

  Widget content() {
    Refsens.onValue.listen((event) {
      setState(() {
        kadarvalue = event.snapshot.value.toString();
      });
    });
    Refstat.onValue.listen((event) {
      setState(() {
        kondisi = event.snapshot.value.toString();
      });
    });
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/R.gif',
            width: 500,
            height: 500,
          ),
          read1(),
          read2()
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'WELCOME TO',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 30,
              fontFamily: 'SpaceMono-bold'),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/white.jpg'),
                fit: BoxFit.cover)),
        alignment: Alignment.center,
        child: StreamBuilder(
            stream: Ref.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something wrong");
              } else if (snapshot.hasData) {
                return content();
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      //backgroundColor: Colors.white,
    );
  }
}