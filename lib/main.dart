import 'package:flutter/material.dart';
import 'package:lixar_music/Page/DetailPage.dart';
import 'package:lixar_music/Page/HomePage.dart';
import 'package:lixar_music/Page/IntroductionPage.dart';
import 'package:lixar_music/Page/LoginPage.dart';
import 'package:lixar_music/Page/ProfilePage.dart';
import 'package:lixar_music/Page/RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color.fromARGB(255, 14, 157, 157),
      )),
      home: IntroductionPage(),
      routes: <String, WidgetBuilder>{
        '/homePage': (BuildContext context) => HomePage(),
        '/loginPage': (BuildContext context) => LoginPage(),
        '/registPage': (BuildContext context) => RegisterPage(),
        '/profilePage': (BuildContext context) => ProfilePage(),
      },
    );
  }
}
