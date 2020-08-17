import 'package:flutter/material.dart';
import 'package:mocity/constants/ui_constants.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: appPrimaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Contact us", style: TextStyle(fontFamily: appFontFamily, color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Email us @ mocityinfo@gmail.com",
                style: TextStyle(
                        fontFamily: appFontFamily,
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}