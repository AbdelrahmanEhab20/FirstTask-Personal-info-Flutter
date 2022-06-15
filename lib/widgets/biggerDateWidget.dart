import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../icons.dart';

class BiggerDateWidget extends StatefulWidget {
  @override
  State<BiggerDateWidget> createState() => concatenation();
}

class concatenation extends State<BiggerDateWidget> {
  final _controllerDay = TextEditingController();
  final _controllerMonth = TextEditingController();
  final _controllerYear = TextEditingController();
  String errorMessageDate = '';

  //Validate the entire date of the person after concatination
  // bool isAdult() {
  //   String dayValue = _controllerDay.value.text;
  //   String monthValue = _controllerMonth.value.text;
  //   String yearValue = _controllerYear.value.text;
  //   DateTime birthOfDate = DateTime(
  //       int.parse(yearValue), int.parse(monthValue), int.parse(dayValue));
  //Start Check From here is Adult or not
  // String datePattern = "dd-MM-yyyy";

  //   DateTime today = DateTime.now();

  //   int yearDiff = today.year - birthOfDate.year;

  //   return yearDiff > 18 || yearDiff == 18;
  // }

  //Validate Entering Day
  void testingOnChangeDay() {
    String dayValue = _controllerDay.value.text;
    // String monthValue = _controllerMonth.value.text;
    // String yearValue = _controllerYear.value.text;

    if (dayValue.isEmpty) {
      setState(() {
        errorMessageDate = '*This Field is Required';
      });
    }

    if (!(1 <= int.parse(dayValue) && 31 >= int.parse(dayValue))) {
      setState(() {
        errorMessageDate = '*Wrong Date , Enter Acceptable Day Date';
      });
    } else {
      setState(() {
        errorMessageDate = '';
      });
    }
  }

  void submitDay() {
    String dayValue = _controllerDay.value.text;
    setState(() {
      if (errorMessageDate == '') print("Day :" + dayValue);
    });
  }

  //Validate Entering Month
  void testingOnChangeMonth() {
    // String dayValue = _controllerDay.value.text;
    String monthValue = _controllerMonth.value.text;
    // String yearValue = _controllerYear.value.text;
    // int monthValue = _controllerDay.value.text as int;if (dayValue.isEmpty) {
    if (monthValue.isEmpty) {
      setState(() {
        errorMessageDate = '*This Field is Required';
      });
    }
    if (!(1 <= int.parse(monthValue) && 12 >= int.parse(monthValue))) {
      setState(() {
        errorMessageDate = '*Wrong Date , Enter Acceptable Month Date';
      });
    } else {
      setState(() {
        errorMessageDate = '';
      });
    }
  }

  void submitMonth() {
    String dayValue = _controllerDay.value.text;
    setState(() {
      if (errorMessageDate == '') print("Month :" + dayValue);
    });
  }

  //Validate Entering Year
  void testingOnChangeYear() {
    // String dayValue = _controllerDay.value.text;
    // String monthValue = _controllerMonth.value.text;
    String yearValue = _controllerYear.value.text;
    // int monthValue = _controllerDay.value.text as int;
    if (yearValue.isEmpty) {
      setState(() {
        errorMessageDate = '*This Field is Required';
      });
    }
    if (!(int.parse(yearValue) <= 2004 && int.parse(yearValue) >= 1945)) {
      setState(() {
        errorMessageDate = '*Wrong Date , Enter Acceptable Year Date';
      });
    } else {
      setState(() {
        errorMessageDate = '';
      });
    }
  }

  void submitYear() {
    String monthValue = _controllerMonth.value.text;
    String yearValue = _controllerYear.value.text;
    String dayValue = _controllerDay.value.text;
    if (int.parse(monthValue) == 2 &&
        (int.parse(yearValue) % 4 == 0) &&
        int.parse(dayValue) >= 30) {
      setState(() {
        errorMessageDate = '* February in this year only 29 days';
      });
    }
    if (int.parse(monthValue) == 2 &&
        (int.parse(yearValue) % 4 != 0) &&
        int.parse(dayValue) >= 29) {
      setState(() {
        errorMessageDate = '*February in this year only 28 days';
      });
    }
    if ((int.parse(monthValue) == 4 ||
            int.parse(monthValue) == 6 ||
            int.parse(monthValue) == 9 ||
            int.parse(monthValue) == 11) &&
        int.parse(dayValue) == 31) {
      setState(() {
        errorMessageDate = '*Months 4,6,9,11  only 30 days';
      });
    }
    setState(() {
      if (errorMessageDate == '')
        print(
            "Date : ${int.parse(dayValue)}-${int.parse(monthValue)}-${int.parse(yearValue)}");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spacer(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: size.width * 0.30,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onChanged: (value) => testingOnChangeDay(),
                onEditingComplete: () => submitDay(),
                controller: _controllerDay,
                keyboardType: TextInputType.number,
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
              width: size.width * 0.29,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onEditingComplete: () => submitMonth(),
                controller: _controllerMonth,
                onChanged: (value) => testingOnChangeMonth(),
                keyboardType: TextInputType.number,
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
              width: size.width * 0.29,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _controllerYear,
                onChanged: (value) => testingOnChangeYear(),
                onEditingComplete: () => submitYear(),
                keyboardType: TextInputType.number,
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
        if (errorMessageDate != '')
          Container(
            margin: EdgeInsets.only(left: 0, right: 110),
            child: Text(errorMessageDate,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.red,
                )),
          ),
      ],
    );
  }
}
