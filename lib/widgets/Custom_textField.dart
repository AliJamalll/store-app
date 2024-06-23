import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.onChange,this.obscureText = false,this.hintText,this.inputType});

  Function(String)? onChange;
  String? hintText;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      keyboardType: inputType,
      onChanged: onChange,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                 // color: Colors.white
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                 // color: Colors.white
              )
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  //color: Colors.white
              )
          )
      ),
    );
  }
}
