import 'package:flutter/material.dart';
import 'package:mocity/constants/ui_constants.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final Color iconColor;

  const MenuItem({Key key, this.icon, this.title, this.onTap, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontFamily: appFontFamily, fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
