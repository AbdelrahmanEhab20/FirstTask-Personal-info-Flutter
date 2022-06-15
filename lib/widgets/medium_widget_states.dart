import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../icons.dart';

class MediumCountryWidget extends StatefulWidget {
  @override
  State<MediumCountryWidget> createState() => _MediumCountryWidgetState();
}

class _MediumCountryWidgetState extends State<MediumCountryWidget> {
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
  Widget build(BuildContext context) {
    final String dropDownIcon = 'assets/icons/dropDown.svg';
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacer(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: size.width * 0.44,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
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
          width: size.width * 0.44,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(CustomIcons.state_icon, size: 16, color: Color(0xFF757575)),
              DropdownButton(
                icon: SvgPicture.asset(
                  dropDownIcon,
                  color: Color(0xFF161B45),
                ),
                underline: SizedBox(),
                value: selectedValue,
                items: statesList,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                    print("Your State : " + selectedValue);
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
// TextField(
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 icon: Icon(CustomIcons.state_icon,
//                     size: 16, color: Color(0xFF757575)),
//                 hintText: 'States'),
//           )
