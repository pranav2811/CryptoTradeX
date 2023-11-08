import 'package:cryptotradex/Screens/login_screen.dart';
// import 'AuthGate.dart';
import 'package:cryptotradex/data/theme_data.dart';
import 'package:cryptotradex/firebase_options.dart';
import 'package:cryptotradex/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    firebaseAppCheck.getToken().then((value) => debugPrint("APP CHECK: $value"));
    runApp(const MyApp());
  } catch (e) {
    debugPrint("Error initializing Firebase");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        debugShowCheckedModeBanner: false,
        title: 'Crypto App',
        home: auth.currentUser == null ? const loginScreen() : const HomePage(),
        theme: darkModeTheme,
        darkTheme: darkModeTheme,
      );
    });
  }
}
