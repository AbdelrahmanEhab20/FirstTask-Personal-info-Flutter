import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons.dart';

class biggerGenderWidget extends StatefulWidget {
  String chooseMale = '';
  String chooseFemale = '';
  String FinalResult = '';
  Function ChangeColorContainerMale;
  Function ChangeColorContainerFemale;
  Function ChangeColorContainerBoth;
  Color fillContainerMale;
  Color fillContainerFemale;
  biggerGenderWidget(
      this.chooseFemale,
      this.chooseMale,
      this.FinalResult,
      this.ChangeColorContainerMale,
      this.ChangeColorContainerFemale,
      this.ChangeColorContainerBoth,
      this.fillContainerMale,
      this.fillContainerFemale);

  @override
  State<biggerGenderWidget> createState() => _biggerGenderWidgetState();
}

class _biggerGenderWidgetState extends State<biggerGenderWidget> {
  @override
  Widget build(BuildContext context) {
    final String maleVectorIcon = 'assets/icons/maleIcon.svg';
    Size size = MediaQuery.of(context).size;
    Color TextColorBtn = Color(0xFF757575);

    return Column(
      children: [
        Row(
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
                      onPressed: () => widget.ChangeColorContainerBoth(),
                      child: Text(
                        'Gender*',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: TextColorBtn),
                      ))
                ],
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
                  color: widget.fillContainerMale,
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
                        onPressed: () => widget.ChangeColorContainerMale(),
                        child: Text(
                          'Male',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: TextColorBtn),
                        ))
                  ],
                )),
            SizedBox(
              width: 5,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.29,
                decoration: BoxDecoration(
                  color: widget.fillContainerFemale,
                  border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(CustomIcons.female_icon,
                        size: 16, color: Color(0xFF757575)),
                    TextButton(
                        onPressed: () => widget.ChangeColorContainerFemale(),
                        child: Text(
                          'Female',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: TextColorBtn),
                        ))
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
