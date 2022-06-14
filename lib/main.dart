import 'package:flutter/material.dart';
import 'package:task_one/icons.dart';
import 'package:task_one/widgets/submit_Button_Widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/biggerDateWidget.dart';
import 'widgets/biggerGenderWidget.dart';
import 'widgets/medium_widget_states.dart';
import 'widgets/profile_pic_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RegExp regex = new RegExp('[a-zA-Z]');
  final _controllerFirstName = TextEditingController();
  final _controllerLastName = TextEditingController();
  String errorMessageFirst = '';
  String errorMessageLast = '';

  // Function Validate FirstName
  void testingOnChangeFirstName() {
    final textFirst = _controllerFirstName.value.text;
    if (regex.hasMatch(textFirst) == false || textFirst.isEmpty) {
      setState(() {
        errorMessageFirst = 'Enter A Valid First Name Required';
      });
    } else {
      setState(() {
        errorMessageFirst = '';
      });
    }
  }

  // Function Validate LastName
  void testingOnChangeLastName() {
    final textLast = _controllerLastName.value.text;
    if (regex.hasMatch(textLast) == false || textLast.isEmpty) {
      setState(() {
        errorMessageLast = 'Enter A Valid Last Name Required';
      });
    } else {
      setState(() {
        errorMessageLast = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task-One',
      //Start Of The Page before Splitting Widgets
      home: Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        appBar: AppBar(
          backgroundColor: Color(0xFFF7F7F7),
          elevation: 0,
          title: Image.asset(
            'assets/images/logo_stract.png',
            scale: 0.85,
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
                // Big Container File Used Here
                BuildTextFieldContainer(
                  errorMesseage: errorMessageFirst,
                  customChild: TextField(
                    // onEditingComplete: () => _errorLastText(),
                    onChanged: ((value) => testingOnChangeFirstName()),
                    controller: _controllerFirstName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(CustomIcons.person_icon,
                            size: 18, color: Color(0xFF757575)),
                        hintText: 'First Name*'),
                  ),
                ),
                if (errorMessageFirst != '')
                  Text(errorMessageFirst,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                      )),
                // _errorFirstText != null
                //      Text(
                //         _errorFirstText!,
                //       )
                //     : Text('data'),
                SizedBox(height: 15),
                BuildTextFieldContainer(
                  errorMesseage: errorMessageLast,
                  customChild: TextField(
                    onChanged: ((value) => testingOnChangeLastName()),
                    controller: _controllerLastName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(CustomIcons.person_icon,
                            size: 18, color: Color(0xFF757575)),
                        hintText: 'Last Name*'),
                  ),
                ),
                if (errorMessageLast != '')
                  Text(errorMessageLast,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                      )),
                // Text(
                //   _errorFirstText!,
                //   style: TextStyle(color: Colors.red),
                // ),
                SizedBox(height: 15),
                // File Date in separated structure Widgets --> Wrapping the values
                BiggerDateWidget(),
                SizedBox(height: 15),
                // File Gender Male / Female Widgets
                biggerGenderWidget(),
                SizedBox(height: 15),
                // File Country State Widgets
                MediumCountryWidget(),
                SizedBox(height: 15),
                // File Country State Widgets
                ProfilePicUpload(),
                SizedBox(height: 20),
                //Button Submit all Data of the Personal Info
                SubmitButtonDone(),
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
  final String errorMesseage;

  const BuildTextFieldContainer(
      {Key? key, this.customChild, required this.errorMesseage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return errorMesseage != ''
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width * .9,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 254, 4, 4)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: customChild,
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width * .9,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: customChild,
          );
  }
}

//  final String errorIconSvg = 'assets/icons/error.svg';

//     Container(
//               alignment: Alignment.centerRight,
//               child: SvgPicture.asset(
//                 errorIconSvg,
//                 color: Colors.red,
//               ),
//             )
