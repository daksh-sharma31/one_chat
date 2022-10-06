import 'package:flutter/material.dart';

import 'colors.dart';
Color color1= HexColor("#437dd9");
const textInputDecoration=InputDecoration(
  labelStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.w300),
  focusedBorder:OutlineInputBorder(

    borderSide: BorderSide(width: 1,
        color: Colors.indigoAccent),
  ),

  enabledBorder:OutlineInputBorder(
    borderSide: BorderSide(width: 1,
        color: Colors.indigoAccent),
  ),
  errorBorder:OutlineInputBorder(
    borderSide: BorderSide(width: 1,color: Colors.indigoAccent),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(3)),
    borderSide: BorderSide(
        color: Colors.indigoAccent, width: 1
    ),
  ),
);
