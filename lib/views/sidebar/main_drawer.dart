import 'package:flutter/material.dart';
import 'package:mocity/constants/ui_constants.dart';
import 'package:mocity/views/manage/edit_location.dart';
import 'package:mocity/views/overview/home.dart';
import 'package:mocity/views/sidebar/menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

//https://www.youtube.com/watch?v=iX07Xnn4ol8&t=12s
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  SharedPreferences _prefs;
  String _cityName = 'Sambalpur';

  @override
  void initState() {
    super.initState();
    //_cityId = prefs.getInt('cityId');
    _loadWidget();
  }

  _loadWidget() async {
     _prefs = await SharedPreferences.getInstance();
     setState(() {
        _cityName = _prefs.getString('cityName');
     });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child:  Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: appPrimaryColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                      ),
                      ListTile(
                        title: Text(
                          "MoCity",
                          style: TextStyle(fontFamily: appFontFamily, color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        subtitle: Text(
                          _cityName,
                          style: TextStyle(
                            fontFamily: appFontFamily,
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                        trailing: CircleAvatar(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          radius: 20,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditLocation(),
                          ));
                        },    
                      ),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.local_pharmacy,
                        title: "Doctors",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Doctors")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.info,
                        title: "News",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "News")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.list,
                        title: "Explore",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Explore")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.live_help,
                        title: "Emergency",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Emergency")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.grain,
                        title: "Covid-19",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Covid-19")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.local_hospital,
                        title: "Healthcare",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Healthcare")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.school,
                        title: "Education",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Education")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.card_travel,
                        title: "Tourism",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Tourism")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_cart,
                        title: "Shopping",
                        iconColor: appMenuIconColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Shopping")));
                        },
                      ),
                      /*MenuItem(
                        icon: Icons.card_giftcard,
                        title: "Events",
                      ),*/
                      MenuItem(
                        icon: Icons.contact_mail,
                        title: "Contact",
                        iconColor: appMenuIconColor,
                      ),
                     /* Divider(
                        height: 30,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
      );
  }
}