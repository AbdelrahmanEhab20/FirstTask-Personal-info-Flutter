import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons.dart';

class ProfilePicUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String addVectorIcon = 'assets/icons/Vector.svg';
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 345,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
              child: SvgPicture.asset(
                addVectorIcon,
                color: Color.fromARGB(255, 102, 100, 100),
              ),
            ),
          ),
          Text(
            'Upload Profile Picture',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 127, 123, 123)),
            textAlign: TextAlign.center,
          ),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                CustomIcons.cloud_icon,
                color: Color(0xFF161B45),
              ))
        ],
      ),
    );
  }
}
