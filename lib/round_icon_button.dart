import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icondata;
  final void Function() onpressed;

  RoundIconButton({required this.icondata,required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed ,
      fillColor: const Color(0xFF1C1F32),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(height:56.0,width:56.0),
      child: Icon(icondata,size: 30,),
    );

  }
}