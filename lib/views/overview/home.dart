import 'package:flutter/material.dart';
import 'package:mocity/constants/ui_constants.dart';
import 'package:mocity/views/overview/body.dart';
import 'package:mocity/views/sidebar/main_drawer.dart';

class HomeScreen extends StatelessWidget {

  final menu;
  const HomeScreen({Key key, @required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: MainDrawer(),
      body: Body(menu: menu)
      /*WillPopScope(
        //Wrap out body with a `WillPopScope` widget that handles when a user is cosing current route
        onWillPop: () async {
          Future.value(false); //return a `Future` with false value so this route cant be popped or closed.
        },
        child: Body(menu: menu)
      ),*/
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      //automaticallyImplyLeading: false,
      backgroundColor: appPrimaryColor,
      title: Text("MoCity $menu", style: TextStyle(fontFamily: appFontFamily, color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
      centerTitle: true,
      elevation: 0.2
      /*actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],*/
    );
  }
}
