import 'package:flutter/material.dart';



class ChangePasswordTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final double fontSize;
  final IconData suffixIcon;
  final Function onTapSuffix;
  final Color suffixColor;
  final bool isObscureText;
  final double iconSize;
  final Function onChange;

  const ChangePasswordTextField({
    Key key,
    this.hintText,
    this.isObscureText = false,

    this.maxLine =1 ,
    this.fontSize,
    this.suffixIcon,
    this.onTapSuffix,
    this.suffixColor, this.iconSize, this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),   color: Colors.white,),
      child: TextFormField(
        obscureText: isObscureText,
        maxLines: maxLine,
        onChanged: (value)=>onChange(value),
        decoration: InputDecoration(
          suffixIcon: suffixIcon == null
              ? null
              : GestureDetector(
            onTap: ()=>onTapSuffix(),
            child: Icon(
              suffixIcon,
              color: suffixColor,
              size: iconSize,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: fontSize ?? 14),
          // contentPadding: EdgeInsets.only(top: 10.w, left: 10.w, bottom: 10.w),
          focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(width: 2, color: Colors.purple.withOpacity(0.23)),
              borderRadius: BorderRadius.circular(5)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(
                  color: Colors.white, width: 2.0
              ),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
    );
  }
}
