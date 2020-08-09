import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mocity/constants/ui_constants.dart';
import 'package:mocity/services/push_notification_service.dart';
import 'package:mocity/views/manage/edit_location.dart';
import 'package:mocity/views/overview/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences _prefs;
  String _cityName;
  bool _hasSelectedLocation = false;

  PushNotificationService get _pushNotificationService => GetIt.I<PushNotificationService>();

  String _versionName = 'v1.0';
  final splashDelay = 4;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
     _prefs = await SharedPreferences.getInstance();
    _cityName = _prefs.getString('cityName');
    if(_cityName == null){
      _hasSelectedLocation = false;
    }else{
      _hasSelectedLocation = true;
    }
    // Register for push notifications
   // await _pushNotificationService.initialise();
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if(_hasSelectedLocation){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen(menu: "Doctors")));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => EditLocation()));
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /*Image.asset(
                        'assets/images/splash.jpg',
                        height: 300,
                        width: 300,
                      ),*/
                      Text(
                          "MoCity",
                          style: TextStyle(fontFamily: appFontFamily, color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                     // CircularProgressIndicator(),
                      Container(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Spacer(),
                            Text(_versionName, style: TextStyle(fontFamily: appFontFamily, color: Colors.white),),
                            Spacer(
                              flex: 4,
                            ),
                            Text('Made in Sambalpur', style: TextStyle(fontFamily: appFontFamily, color: Colors.white),),
                            Spacer(),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
