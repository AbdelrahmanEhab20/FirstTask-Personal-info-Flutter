import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons.dart';

class biggerGenderWidget extends StatelessWidget {
  const biggerGenderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String maleVectorIcon = 'assets/icons/maleIcon.svg';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacer(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF9E9E9E)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            // textAlign: TextAlign.center,
            enabled: false,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: SvgPicture.asset(
                  maleVectorIcon,
                  color: Color.fromARGB(255, 102, 100, 100),
                ),
                hintText: 'Gender*'),
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
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(CustomIcons.male_icon,
                    size: 16, color: Color(0xFF757575)),
                hintText: 'Male'),
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
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(CustomIcons.female_icon,
                    size: 16, color: Color(0xFF757575)),
                hintText: 'Female'),
          ),
        )
      ],
    );
  }
}
