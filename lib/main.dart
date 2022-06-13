import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/icons.dart';

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
      //
      home: Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        appBar: AppBar(
          backgroundColor: Color(0xFFF7F7F7),
          elevation: 0,
          title: Image.asset('assets/images/logo_stract.png'
              // 'assets/icons/logo_stract.svg',
              // fit: BoxFit.cover,
              ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  child: Center(
                      child: Text(
                    'Personal Information',
                    style: TextStyle(
                        color: Color(0xFF161B45),
                        fontFamily: 'Avenir LT Std',
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  )),
                ),
                SizedBox(height: 10),
                BuildTextFieldContainer(
                  customChild: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(CustomIcons.person_icon,
                            size: 18, color: Color(0xFF757575)),
                        hintText: 'First Name*'),
                  ),
                ),
                SizedBox(height: 10),
                BuildTextFieldContainer(
                  customChild: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(CustomIcons.person_icon,
                            size: 18, color: Color(0xFF757575)),
                        hintText: 'Last Name*'),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF9E9E9E)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(CustomIcons.date_icon,
                                size: 18, color: Color(0xFF757575)),
                            hintText: 'Day*'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF9E9E9E)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // icon:
                            //     Icon(Icons.date_range, color: Color(0xFF757575)),
                            hintText: 'Month*'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF9E9E9E)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // icon:
                            //     Icon(Icons.date_range, color: Color(0xFF757575)),
                            hintText: 'Year*'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF9E9E9E)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        enabled: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(CustomIcons.gender_icon,
                                size: 16, color: Color(0xFF757575)),
                            hintText: 'Gender'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF9E9E9E)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(CustomIcons.male_icon,
                                size: 16, color: Color(0xFF757575)),
                            hintText: 'Male'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF9E9E9E)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(CustomIcons.female_icon,
                                size: 16, color: Color(0xFF757575)),
                            hintText: 'Female'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildTextFieldContainer extends StatelessWidget {
  final Widget? customChild;

  const BuildTextFieldContainer({Key? key, this.customChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * .9,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF9E9E9E)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: customChild,
    );
  }
}
