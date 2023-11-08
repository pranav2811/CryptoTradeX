import 'package:cryptotradex/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _controller_name = TextEditingController();
  final _phone_controller_name = TextEditingController();
  final _email_controller_name = TextEditingController();
  final _password_controller_name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible1 = false;
  bool _isVisible2 = false;

  @override
  void dispose() {
    _controller_name.dispose();
    _phone_controller_name.dispose();
    _email_controller_name.dispose();
    _password_controller_name.dispose();

    super.dispose();
  }

  bool nameIsEmpty = false;
  bool phoneIsEmpty = false;
  bool emailIsEmpty = false;
  bool passwordIsEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201A30),
      appBar: AppBar(
        backgroundColor: const Color(0xFF201A30),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.grey,
          onPressed: () {
            _navigateToLoginScreen(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Center(
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      ' Please fill the input here',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          wordSpacing: 2,
                          letterSpacing: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: _controller_name,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        errorText: nameIsEmpty ? 'Name cannot be empty' : null,
                        labelText: "FULL NAME",
                        labelStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        prefixIcon: const Icon(Icons.person),
                        iconColor: Colors.white,
                        filled: true,
                        fillColor: const Color(0xFF38304C),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IntlPhoneField(
                    controller: _phone_controller_name,
                    dropdownTextStyle: const TextStyle(color: Colors.grey),
                    initialCountryCode: "IN",
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        errorText:
                            phoneIsEmpty ? 'Phone number cannot be empty' : null,
                        counterText: "",
                        filled: true,
                        fillColor: const Color(0xFF38304C),
                        labelText: "MOBILE NUMBER",
                        labelStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        suffixIcon: const Icon(Icons.phone),
                        iconColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    //controller: phoneno,
                  ),
                  //TextField(
                  // maxLength: 10,
                  // decoration: InputDecoration(labelText: "Mobile Number", labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                  // prefixIcon: const Icon(Icons.phone), iconColor: Colors.grey,
                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  //controller: controller.phoneNo,
                  //),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _email_controller_name,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        errorText: emailIsEmpty ? 'Email cannot be empty' : null,
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
                    height: 10,
                  ),
                  TextField(
                    controller: _password_controller_name,
                    obscureText: !_isVisible1,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        errorText:
                            passwordIsEmpty ? 'Password cannot be empty' : null,
                        labelText: "PASSWORD",
                        labelStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        prefixIcon: const Icon(Icons.lock_outlined),
                        iconColor: Colors.white,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible1 = !_isVisible1;
                              });
                            },
                            icon: _isVisible1
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        filled: true,
                        fillColor: const Color(0xFF38304C),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: !_isVisible2,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "CONFIRM PASSWORD",
                        labelStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        prefixIcon: const Icon(Icons.lock_outlined),
                        iconColor: Colors.white,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible2 = !_isVisible2;
                              });
                            },
                            icon: _isVisible2
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        filled: true,
                        fillColor: const Color(0xFF38304C),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(height: 40),
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
                      setState(() async {
                        if (_controller_name.text.isEmpty) {
                          nameIsEmpty = true;
                        }
                        if (_email_controller_name.text.isEmpty) {
                          emailIsEmpty = true;
                        }
                        if (_phone_controller_name.text.isEmpty) {
                          emailIsEmpty = true;
                        }
                        if (_password_controller_name.text.isEmpty) {
                          emailIsEmpty = true;
                        }
                        if (_controller_name.text.isNotEmpty &&
                            _email_controller_name.text.isNotEmpty &&
                            _phone_controller_name.text.isNotEmpty &&
                            _password_controller_name.text.isNotEmpty) {
                          nameIsEmpty = false;
                          emailIsEmpty = false;
                          phoneIsEmpty = false;
                          passwordIsEmpty = false;
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _email_controller_name.text,
                                    password: _password_controller_name.text);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const loginScreen()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              debugPrint('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              debugPrint('The account already exists for that email.');
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                          // _navigateToLoginScreen(context);
                        }
                      });
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(fontSize: 20, color: Color(0xFF201A30)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToLoginScreen(context);
                        },
                        child: const Text(
                          'SignIn',
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
}

void _navigateToLoginScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const loginScreen()));
}
