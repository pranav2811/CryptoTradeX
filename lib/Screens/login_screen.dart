import 'package:cryptotradex/Screens/sign_up_screen.dart';
import 'package:cryptotradex/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:cryptotradex/Screens/forget_password.dart';

import '../view_model/loginViewModel.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool valuefirst = false;
  bool _isVisible = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final LoginViewModel loginController = Get.put(LoginViewModel());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201A30),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                      Checkbox(
                          value: this.valuefirst,
                          onChanged: (bool? value) {
                            setState(() {
                              this.valuefirst = value!;
                            });
                          }),
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
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);

                        if (userCredential.user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Invalid Credentials",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              textColor: Colors.white);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Invalid Credentials. Please Try Again!"),
                          ),
                        );
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text(e.toString()),
                        //   ),
                        // );
                      }
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 20, color: Color(0xFF201A30)),
                    ),
                  ),
                  GestureDetector(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF0DF5E3),
                        ),
                      ),
                      onTap: () {
                        _navigateToForgetPasswordScreen(context);
                      }),
                  const SizedBox(
                    height: 10,
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
      ),
    );
  }

  void signIn() {
    if (_formKey.currentState!.validate()) {
      auth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .whenComplete(
            () => ScaffoldMessenger.of(context)
                .showSnackBar(
                  const SnackBar(
                    content: Text("Logged In Successfully"),
                  ),
                )
                .closed
                .whenComplete(
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                ),
          );
    }
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      auth
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .whenComplete(
            () => ScaffoldMessenger.of(context)
                .showSnackBar(
                  const SnackBar(
                    content: Text("Successfully Signed Up"),
                  ),
                )
                .closed
                .whenComplete(
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                ),
          );
    }
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

void _navigateToForgetPasswordScreen(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()));
}
