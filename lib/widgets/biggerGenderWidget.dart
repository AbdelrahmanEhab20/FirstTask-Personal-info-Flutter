import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons.dart';

class biggerGenderWidget extends StatefulWidget {
  const biggerGenderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<biggerGenderWidget> createState() => _biggerGenderWidgetState();
}

class _biggerGenderWidgetState extends State<biggerGenderWidget> {
  String chooseMale = '';
  String chooseFemale = '';
  Color fillContainerMale = Color.fromRGBO(247, 247, 247, 1);
  Color fillContainerFemale = Color.fromRGBO(247, 247, 247, 1);
  Color TextColorBtn = Color(0xFF757575);

  void ChangeColorContainerMale() {
    setState(() {
      if (chooseFemale == 'Female' || chooseFemale == '') {
        chooseFemale = '';
        chooseMale = 'Male';
        fillContainerMale = Color(0xFF25D7FB);
        fillContainerFemale = Color.fromRGBO(247, 247, 247, 1);
      }
    });
    print('Male:' + chooseMale);
    print('Female:' + chooseFemale);
  }

  void ChangeColorContainerFemale() {
    setState(() {
      if (chooseMale == 'Male' || chooseMale == '') {
        chooseMale = '';
        chooseFemale = 'Female';
        fillContainerFemale = Color(0xFFDF8FEE);
        fillContainerMale = Color.fromRGBO(247, 247, 247, 1);
      }
    });
    print('Male:' + chooseMale);
    print('Female:' + chooseFemale);
  }

  void ChangeColorContainerBoth() {
    setState(() {
      chooseMale = '';
      chooseFemale = '';
      fillContainerMale = Color.fromRGBO(247, 247, 247, 1);
      fillContainerFemale = Color.fromRGBO(247, 247, 247, 1);
      print('Male:' + chooseMale);
      print('Female:' + chooseFemale);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String maleVectorIcon = 'assets/icons/maleIcon.svg';
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacer(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: size.width * 0.30,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF9E9E9E)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                CustomIcons.gender_icon,
                size: 16,
                color: Color.fromARGB(255, 102, 100, 100),
              ),
              TextButton(
                  onPressed: () => ChangeColorContainerBoth(),
                  child: Text(
                    'Gender*',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: TextColorBtn),
                  ))
            ],
          ),
          // child: TextField(
          //   // textAlign: TextAlign.center,
          //   enabled: false,
          //   decoration: InputDecoration(
          //       border: InputBorder.none,
          //       icon: Icon(
          //         CustomIcons.gender_icon,
          //         size: 16,
          //         color: Color.fromARGB(255, 102, 100, 100),
          //       ),
          //       hintText: 'Gender*'),
          // ),
        ),

        SizedBox(
          width: 5,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width * 0.29,
            decoration: BoxDecoration(
              color: fillContainerMale,
              border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  maleVectorIcon,
                  color: Color(0xFF757575),
                  width: 15,
                  height: 15,
                ),
                TextButton(
                    onPressed: () => ChangeColorContainerMale(),
                    child: Text(
                      'Male',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: TextColorBtn),
                    ))
              ],
            )
            // child: TextField(
            //   decoration: InputDecoration(
            //       border: InputBorder.none,
            //       icon: SvgPicture.asset(
            //         maleVectorIcon,
            //         color: Color(0xFF757575),
            //       ),
            //       hintText: 'Male'),
            // ),
            ),
        SizedBox(
          width: 5,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width * 0.29,
            decoration: BoxDecoration(
              color: fillContainerFemale,
              border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(CustomIcons.female_icon,
                    size: 16, color: Color(0xFF757575)),
                TextButton(
                    onPressed: () => ChangeColorContainerFemale(),
                    child: Text(
                      'Female',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: TextColorBtn),
                    ))
              ],
            )
            // child: TextField(
            //   decoration: InputDecoration(
            //       border: InputBorder.none,

            //       hintText: 'Female'),
            // ),
            )
      ],
    );
  }
}
