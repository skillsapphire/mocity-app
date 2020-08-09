import 'package:flutter/material.dart';
import 'package:mocity/constants/constants.dart';
import 'package:mocity/services/item_category_service.dart';
import 'package:mocity/services/item_service.dart';
import 'package:mocity/services/push_notification_service.dart';
import 'package:mocity/services/user_service.dart';
import 'package:mocity/views/Welcome/welcome_screen.dart';
import 'package:mocity/views/overview/home.dart';
import 'package:get_it/get_it.dart';
import 'package:mocity/views/splash/splash_screen.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => ItemService());
  GetIt.I.registerLazySingleton(() => ItemCategoryService());
  GetIt.I.registerLazySingleton(() => UserService());
  GetIt.I.registerLazySingleton(() => PushNotificationService());
}

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoCity App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: HomeScreen()
      routes: {
      "/welcome": (ctx) => WelcomeScreen(),
      "/home": (ctx) => HomeScreen(menu: "Doctors"),
     //   "/": (ctx) => EditLocation(),
      "/": (ctx) => SplashScreen(),
    },
    );
  }
}
