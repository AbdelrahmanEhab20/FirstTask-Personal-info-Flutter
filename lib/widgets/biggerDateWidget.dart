import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../icons.dart';

class BiggerDateWidget extends StatefulWidget {
  final _controllerDay;
  final _controllerMonth;
  final _controllerYear;
  String errorMessageDate;
  BiggerDateWidget(this._controllerDay, this._controllerMonth,
      this._controllerYear, this.errorMessageDate);
  @override
  State<BiggerDateWidget> createState() => BiggerDateWidgetState();
}

class BiggerDateWidgetState extends State<BiggerDateWidget> {
  //Validate Entering Day
  void testingOnChangeDay() {
    String dayValue = widget._controllerDay.value.text;

    if (dayValue.isEmpty) {
      setState(() {
        widget.errorMessageDate = '*This Field is Required';
      });
    }

    if (!(1 <= int.parse(dayValue) && 31 >= int.parse(dayValue))) {
      setState(() {
        widget.errorMessageDate = '*Wrong Date , Enter Acceptable Day Date';
      });
    } else {
      setState(() {
        widget.errorMessageDate = '';
      });
    }
  }

  void submitDay() {
    String dayValue = widget._controllerDay.value.text;
    setState(() {
      if (widget.errorMessageDate == '') print("Day :" + dayValue);
    });
  }

  //Validate Entering Month
  void testingOnChangeMonth() {
    String monthValue = widget._controllerMonth.value.text;

    if (monthValue.isEmpty) {
      setState(() {
        widget.errorMessageDate = '*This Field is Required';
      });
    }
    if (!(1 <= int.parse(monthValue) && 12 >= int.parse(monthValue))) {
      setState(() {
        widget.errorMessageDate = '*Wrong Date , Enter Acceptable Month Date';
      });
    } else {
      setState(() {
        widget.errorMessageDate = '';
      });
    }
  }

  void submitMonth() {
    String dayValue = widget._controllerDay.value.text;
    setState(() {
      if (widget.errorMessageDate == '') print("Month :" + dayValue);
    });
  }

  //Validate Entering Year
  void testingOnChangeYear() {
    String yearValue = widget._controllerYear.value.text;

    if (yearValue.isEmpty) {
      setState(() {
        widget.errorMessageDate = '*This Field is Required';
      });
    }
    if (!(int.parse(yearValue) <= 2004 && int.parse(yearValue) >= 1945)) {
      setState(() {
        widget.errorMessageDate = '*Wrong Date , Enter Acceptable Year Date';
      });
    } else {
      setState(() {
        widget.errorMessageDate = '';
      });
    }
  }

  void submitYear() {
    String monthValue = widget._controllerMonth.value.text;
    String yearValue = widget._controllerYear.value.text;
    String dayValue = widget._controllerDay.value.text;
    if (int.parse(monthValue) == 2 &&
        (int.parse(yearValue) % 4 == 0) &&
        int.parse(dayValue) >= 30) {
      setState(() {
        widget.errorMessageDate = '* February in this year only 29 days';
      });
    }
    if (int.parse(monthValue) == 2 &&
        (int.parse(yearValue) % 4 != 0) &&
        int.parse(dayValue) >= 29) {
      setState(() {
        widget.errorMessageDate = '*February in this year only 28 days';
      });
    }
    if ((int.parse(monthValue) == 4 ||
            int.parse(monthValue) == 6 ||
            int.parse(monthValue) == 9 ||
            int.parse(monthValue) == 11) &&
        int.parse(dayValue) == 31) {
      setState(() {
        widget.errorMessageDate = '*Months 4,6,9,11  only 30 days';
      });
    }
    setState(() {
      if (widget.errorMessageDate == '')
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
                controller: widget._controllerDay,
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
                controller: widget._controllerMonth,
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
                controller: widget._controllerYear,
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
        if (widget.errorMessageDate != '')
          Container(
            margin: EdgeInsets.only(left: 0, right: 110),
            child: Text(widget.errorMessageDate,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.red,
                )),
          ),
      ],
    );
  }
}
