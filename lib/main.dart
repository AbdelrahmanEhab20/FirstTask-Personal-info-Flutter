import 'package:flutter/material.dart';
import 'package:task_one/icons.dart';
import 'package:task_one/widgets/submit_Button_Widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/biggerDateWidget.dart';
import 'widgets/biggerGenderWidget.dart';
import 'widgets/profile_pic_widget.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  /******************************** */
  // For Gender M/F
  String chooseMale = '';
  String chooseFemale = '';
  String CheckGenderResult = '';
  Gradient fillContainerMale = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFFF),
      Color(0xFFFF),
    ],
  );
  Gradient fillContainerFemale = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFFF),
      Color(0xFFFF),
    ],
  );
  /******************************** */
  // For firstName and LastName
  RegExp regex = RegExp(r'^[a-z A-Z]+$');
  String errorMessageFirst = '';
  String errorMessageLast = '';

  //for Date Widget
  final _controllerFirstName = TextEditingController();
  final _controllerLastName = TextEditingController();
  final _controllerMonth = TextEditingController();
  final _controllerYear = TextEditingController();
  String errorMessageDate = '';
  final _controllerDay = TextEditingController();

  /******************************** */
  //for States Widget
  final String dropDownIcon = 'assets/icons/dropDown.svg';
  //selected value default
  String selectedValue = "Cairo";
  // List of States
  List<DropdownMenuItem<String>> get statesList {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Cairo"), value: "Cairo"),
      DropdownMenuItem(child: Text("Alexandria"), value: "Alexandria"),
      DropdownMenuItem(child: Text("Aswan"), value: "Aswan"),
      DropdownMenuItem(child: Text("Giza"), value: "Giza"),
      DropdownMenuItem(child: Text("Suez"), value: "Suez"),
    ];
    return menuItems;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Function Validate FirstName
  void testingOnChangeFirstName() {
    final textFirst = widget._controllerFirstName.value.text;
    if (widget.regex.hasMatch(textFirst) == false || textFirst.isEmpty) {
      setState(() {
        widget.errorMessageFirst = '* Enter A Valid First Name , Required';
      });
    } else {
      setState(() {
        widget.errorMessageFirst = '';
      });
    }
  }
  /******************************** */

  // Function Validate LastName
  void testingOnChangeLastName() {
    final textLast = widget._controllerLastName.value.text;
    if (widget.regex.hasMatch(textLast) == false || textLast.isEmpty) {
      setState(() {
        widget.errorMessageLast = '* Enter A Valid Last Name , Required';
      });
    } else {
      setState(() {
        widget.errorMessageLast = '';
      });
    }
  }
  /******************************** */

  // Function Print FirstName
  void printFirstName() {
    final textFirst = widget._controllerFirstName.value.text;
    print('FirstName:' + textFirst);
  }

  // Function Print LastName
  void printLastName() {
    final textLast = widget._controllerLastName.value.text;
    print('LastName:' + textLast);
  }

  /******************************** */
  void ChangeColorContainerMale() {
    setState(() {
      if (widget.chooseFemale == '' || widget.chooseFemale == 'Female') {
        widget.chooseFemale = '';
        widget.chooseMale = 'Male';
        widget.CheckGenderResult = widget.chooseMale;
        widget.fillContainerMale = LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF25D7FB),
            Color(0xFFDF8FEE),
          ],
        );
        widget.fillContainerFemale = LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        );
      }
    });
    print('Male:' + widget.chooseMale);
    print('Female:' + widget.chooseFemale);
    print('ResGender:' + widget.CheckGenderResult);
  }

  void ChangeColorContainerFemale() {
    setState(() {
      if (widget.chooseMale == '' || widget.chooseMale == 'Male') {
        widget.chooseMale = '';
        widget.chooseFemale = 'Female';
        widget.CheckGenderResult = widget.chooseFemale;
        widget.fillContainerFemale = LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF25D7FB),
            Color(0xFFDF8FEE),
          ],
        );
        widget.fillContainerMale = LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFFF),
            Color(0xFFFF),
          ],
        );
      }
    });
    print('Male:' + widget.chooseMale);
    print('Female:' + widget.chooseFemale);
    print('ResGender:' + widget.CheckGenderResult);
  }

  void ChangeColorContainerBoth() {
    setState(() {
      widget.chooseMale = '';
      widget.chooseFemale = '';
      widget.CheckGenderResult = '';
      widget.fillContainerMale = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFFF),
          Color(0xFFFF),
        ],
      );
      ;
      widget.fillContainerFemale = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFFF),
          Color(0xFFFF),
        ],
      );
      ;
      print('Male:' + widget.chooseMale);
      print('Female:' + widget.chooseFemale);
      print('ResGender:' + widget.CheckGenderResult);
    });
  }

  //Submit All Info
  void SubmitAllData(context) {
    final textFirst = widget._controllerFirstName.value.text;
    final textLast = widget._controllerLastName.value.text;
    final dayValue = widget._controllerDay.value.text;
    final yearValue = widget._controllerYear.value.text;
    final monthValue = widget._controllerMonth.value.text;

    //Alert What The inputs ----> SweetAlert Package (Version 2 )

    if (textFirst.isEmpty ||
        textLast.isEmpty ||
        monthValue.isEmpty ||
        yearValue.isEmpty) {
      setState(() {
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.danger,
              title: "Wrong Data , Please Fill It Correct",
            ));
      });
    } else {
      setState(() {
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success,
                title: "User Information , Hello ${textFirst}",
                text:
                    'Full Name: ${textFirst + ' ' + textLast} \n Date of Birth:(${int.parse(dayValue)}-${int.parse(monthValue)}-${int.parse(yearValue)})\n Gender : ${widget.CheckGenderResult}\n Country : Egypt , State : ${widget.selectedValue}'));
      });
    }
  }
  /************************************************************************** */

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
                  errorMesseage: widget.errorMessageFirst,
                  customChild: TextField(
                    // onEditingComplete: () => _errorLastText(),
                    onEditingComplete: () => printFirstName(),
                    onChanged: ((value) => testingOnChangeFirstName()),
                    controller: widget._controllerFirstName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(CustomIcons.person_icon,
                            size: 18, color: Color(0xFF757575)),
                        hintText: 'First Name*'),
                  ),
                ),
                if (widget.errorMessageFirst != '')
                  Container(
                    margin: EdgeInsets.only(left: 0, right: 110),
                    child: Text(widget.errorMessageFirst,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                SizedBox(height: 15),
                BuildTextFieldContainer(
                  errorMesseage: widget.errorMessageLast,
                  customChild: TextField(
                    onEditingComplete: () => printLastName(),
                    onChanged: ((value) => testingOnChangeLastName()),
                    controller: widget._controllerLastName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(CustomIcons.person_icon,
                            size: 18, color: Color(0xFF757575)),
                        hintText: 'Last Name*'),
                  ),
                ),
                if (widget.errorMessageLast != '')
                  Container(
                    margin: EdgeInsets.only(left: 0, right: 110),
                    child: Text(widget.errorMessageLast,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                SizedBox(height: 15),
                // File Date in separated structure Widgets --> Wrapping the values
                BiggerDateWidget(widget._controllerDay, widget._controllerMonth,
                    widget._controllerYear, widget.errorMessageDate),
                SizedBox(height: 15),
                // File Gender Male / Female Widgets
                biggerGenderWidget(
                    widget.chooseFemale,
                    widget.chooseMale,
                    widget.CheckGenderResult,
                    ChangeColorContainerMale,
                    ChangeColorContainerFemale,
                    ChangeColorContainerBoth,
                    widget.fillContainerMale,
                    widget.fillContainerFemale),
                SizedBox(height: 15),
                // File Country State Widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 191, 187, 187)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        // textAlign: TextAlign.center,
                        enabled: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(CustomIcons.country_icon,
                                size: 16, color: Color(0xFF757575)),
                            hintText: 'Egypt'),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 191, 187, 187)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(CustomIcons.state_icon,
                              size: 16, color: Color(0xFF757575)),
                          DropdownButton(
                            icon: SvgPicture.asset(
                              widget.dropDownIcon,
                              color: Color(0xFF161B45),
                            ),
                            underline: SizedBox(),
                            value: widget.selectedValue,
                            items: widget.statesList,
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.selectedValue = newValue!;
                                print("Your State : " + widget.selectedValue);
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                // File Country State Widgets
                ProfilePicUpload(),
                SizedBox(height: 20),
                //Button Submit all Data of the Personal Info
                SubmitButtonDone(SubmitAllData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool focus = false;

class BuildTextFieldContainer extends StatefulWidget {
  const BuildTextFieldContainer(
      {Key? key, this.customChild, required this.errorMesseage})
      : super(key: key);

  final Widget? customChild;
  final String errorMesseage;

  @override
  State<BuildTextFieldContainer> createState() =>
      _BuildTextFieldContainerState();
}

class _BuildTextFieldContainerState extends State<BuildTextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //On Focus Variable Check
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: size.width * .9,
        decoration: BoxDecoration(
          border: Border.all(
              color: widget.errorMesseage != ''
                  ? Color.fromARGB(255, 254, 4, 4)
                  : focus
                      ? Color.fromARGB(157, 13, 160, 25)
                      : Color.fromARGB(255, 191, 187, 187)),
          borderRadius: BorderRadius.circular(30),
        ),
        child: widget.customChild,
      ),
      onTap: () async {
        setState(() {
          focus = !focus;
        });
      },
    );
  }
}
