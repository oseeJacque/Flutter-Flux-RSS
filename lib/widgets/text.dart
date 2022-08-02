
// ignore_for_file: prefer_equal_for_default_values

import 'package:flutter/material.dart';

// ignore: camel_case_types
class textCustom extends Text{
  textCustom(String data,
  {Key? key, textAlign: 
  TextAlign.center,
  color:Colors.indigo,fontSize:15.0 ,
  fontStyle:FontStyle.italic}):
  
  super(key: key, 
    data,
    textAlign: textAlign,
    style: TextStyle(
      color: color, 
      fontSize: fontSize, 
      fontStyle: fontStyle
    )
  );
}