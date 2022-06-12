import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final Color color = HexColor.fromHex('#aabbcc');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task-One',
      theme: ThemeData(
        primaryColor: HexColor("#161B45"),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: Color(0xFFF7F7F7),
          elevation: 0,
          title: Image.asset(
            'assets/images/logo_stract.png',
            fit: BoxFit.cover,
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: Center(
                    heightFactor: 3.5,
                    child: Text(
                      'Personal Information',
                      style: TextStyle(
                          color: Color(0xFF161B45),
                          fontFamily: 'Avenir LT Std',
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    )),
              ),
              BuildTextFieldContainer(
                customchild: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.person, color: Color(0xFF757575)),
                      hintText: 'First Name*'),
                ),
              ),
              BuildTextFieldContainer(
                customchild: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.person, color: Color(0xFF757575)),
                      hintText: 'Last Name*'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTextFieldContainer extends StatelessWidget {
  final Widget? customchild;

  const BuildTextFieldContainer({Key? key, this.customchild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * .9,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF9E9E9E)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: customchild,
    );
  }
}
