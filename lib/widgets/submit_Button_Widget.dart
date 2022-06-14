import 'package:flutter/material.dart';

class SubmitButtonDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF161B45),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 342,
      height: 42,
      decoration: BoxDecoration(
        color: Color(0xFF161B45),
        border: Border.all(color: Color.fromARGB(255, 191, 187, 187)),
        borderRadius: BorderRadius.circular(30.5),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'DONE',
          style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Avenir LT Std'),
        ),
      ),
    );
  }
}
