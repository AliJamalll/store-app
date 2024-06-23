import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,this.onPressed,required this.text});

  VoidCallback? onPressed;
  String? text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 140),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue
        ),
        child: Row(
          children: [
            Text(text!,style: TextStyle(
              color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}
