import 'package:cryptotradex/Screens/sign_up_screen.dart';
import 'package:cryptotradex/ui/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/loginViewModel.dart';

// Future<FirebaseApp> _initializeDefault() async {
//   FirebaseApp firebaseApp = await Firebase.initializeApp();
//   return firebaseApp;
// }

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _isVisible = false;
  final LoginViewModel loginController = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201A30),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/login.png'),
                const SizedBox(height: 5),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Please sign in to continue.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle:
                          const TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon: const Icon(Icons.mail_outline),
                      iconColor: Colors.white,
                      filled: true,
                      fillColor: const Color(0xFF38304C),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: !_isVisible,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle:
                          const TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon: const Icon(Icons.lock_outlined),
                      iconColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      filled: true,
                      fillColor: const Color(0xFF38304C),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Checkbox(
                        value: loginController.checkValue.value,
                        onChanged: (value) {
                          //RxBool temp = value as RxBool;
                          loginController.changeValue(RxBool(value!));
                        })),
                    const SizedBox(width: 10),
                    const Padding(
                      padding: EdgeInsets.only(top: 11.0),
                      child: SizedBox(
                          child: Text("Save Credentials",
                              style: TextStyle(
                                color: Colors.white,
                              ))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0DF5E3),
                      minimumSize: const Size(250, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      textStyle: const TextStyle(
                          color: Color(0xFF201A30),
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    _navigateToHomeScreen(context);
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20, color: Color(0xFF201A30)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    color: Color(0xFF0DF5E3),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account? ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        _navigateToSignUpScreen(context);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Color(0xFF0DF5E3),
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _navigateToSignUpScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const signInScreen()));
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const HomePage()));
}
