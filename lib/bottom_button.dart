import 'package:flutter/material.dart';
import '../constants.dart';

class bottombutton extends StatelessWidget {
  void Function() onpressed;
  String label;

  bottombutton({ required this.onpressed,required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: double.infinity,
        height: 80,
        color: Color(0x89A0F5EE),
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            label,style: kLargeButtonStyle,
            ),
        ),
      ),
    );
  }
}