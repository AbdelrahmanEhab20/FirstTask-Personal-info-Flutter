import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../icons.dart';

class BiggerDateWidget extends StatefulWidget {
  @override
  State<BiggerDateWidget> createState() => _BiggerDateWidgetState();
}

class _BiggerDateWidgetState extends State<BiggerDateWidget> {
  TextEditingController dateinput = TextEditingController();

  //text editing controller for text field
  @override
  void initState() {
    dateinput.text = "";
    //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacer(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            keyboardType: TextInputType.datetime,
            // textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(CustomIcons.date_icon,
                    size: 18, color: Color(0xFF757575)),
                hintText: 'Day*'),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
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
          width: 5,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
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
    );
  }
}
