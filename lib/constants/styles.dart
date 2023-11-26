import 'package:firebase_auth_app/constants/colors.dart';
import 'package:flutter/material.dart';

const TextStyle descriptionStyle =
    TextStyle(fontSize: 10, color: textLight, fontWeight: FontWeight.w200);

const textInputDecoration = InputDecoration(
    hintText: "Email",
    fillColor: bgBlack,
    hintStyle: TextStyle(color: textLight, fontSize: 15),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainYellow, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(100))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainYellow, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(100))));
