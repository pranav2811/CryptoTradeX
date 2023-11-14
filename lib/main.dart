import 'package:cryptotradex/Screens/sign_up_screen.dart';
import 'package:cryptotradex/data/theme_data.dart';
import 'package:cryptotradex/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      name: 'CryptoTradeX',
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
    firebaseAppCheck.activate(
      androidProvider: AndroidProvider.debug,
    );
    firebaseAppCheck
        .getToken()
        .then((value) => debugPrint("APP CHECK: $value"));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    await Hive.initFlutter();
    runApp(const MyApp());
  } catch (e) {
    debugPrint("Error initializing Firebase: $e");
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        debugShowCheckedModeBanner: false,
        title: 'Crypto App',
        home: const signInScreen(),
        theme: darkModeTheme,
        darkTheme: darkModeTheme,
      );
    });
  }
}
