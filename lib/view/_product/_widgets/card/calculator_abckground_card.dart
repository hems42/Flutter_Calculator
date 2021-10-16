import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Expanded calculateBackground(String bg) {
  return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          color: Colors.blueGrey,
          elevation: 15,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
              child: Image(
                image: AssetImage(bg),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ));
}
