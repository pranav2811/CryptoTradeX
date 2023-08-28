import 'package:cryptotradex/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {

  final _controller_name = TextEditingController();
  bool _isVisible1 = false;
  bool _isVisible2 = false;

  @override
  void dispose(){
    _controller_name.dispose();
    super.dispose();
  }
  String? get _errorText{
    final text = _controller_name.value.text;
    if (text.isEmpty){
      return 'Can\'t be empty';
    }
    if(text.length<4){
      return'Too short';
    }
    return null;
  }
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Center(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Create Account', style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5
                  ),),
                ),
                const SizedBox(height: 10,),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(' Please fill the input here', style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    wordSpacing: 2,
                    letterSpacing: 1.5
                  ),),
                ),
                const SizedBox(height: 40,),
                TextField(
                  controller: _controller_name,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    errorText: _errorText,
                      labelText: "FULL NAME",
                      labelStyle: const TextStyle(
                          fontSize: 15, color: Colors.grey
                      ),
                      prefixIcon: const Icon(Icons.person),
                      iconColor: Colors.white,
                      filled: true,
                      fillColor: const Color(0xFF38304C),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                const SizedBox(height: 10,),
                IntlPhoneField(
                  dropdownTextStyle: const TextStyle(
                    color: Colors.grey
                  ),
                  initialCountryCode: "IN",
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                      filled: true,
                      fillColor: const Color(0xFF38304C),
                      labelText: "MOBILE NUMBER",
                      labelStyle: const TextStyle(
                          fontSize: 15, color: Colors.grey),
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
                const SizedBox(height: 10,),
                TextField(
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle: const TextStyle(
                          fontSize: 15, color: Colors.grey
                      ),
                      prefixIcon: const Icon(Icons.mail_outline),
                      iconColor: Colors.white,
                      filled: true,
                      fillColor: const Color(0xFF38304C),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  obscureText: !_isVisible1,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: const TextStyle(
                          fontSize: 15, color: Colors.grey
                      ),
                      prefixIcon: const Icon(Icons.lock_outlined),
                      iconColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isVisible1 = !_isVisible1;
                            });
                          },
                          icon: _isVisible1
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)
                      ),
                      filled: true,
                      fillColor: const Color(0xFF38304C),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: !_isVisible2,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      labelText: "CONFIRM PASSWORD",
                      labelStyle: const TextStyle(
                          fontSize: 15, color: Colors.grey
                      ),
                      prefixIcon: const Icon(Icons.lock_outlined),
                      iconColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isVisible2 = !_isVisible2;
                            });
                          },
                          icon: _isVisible2
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)
                      ),
                      filled: true,
                      fillColor: const Color(0xFF38304C),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
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
                  onPressed: (){
                    _navigateToLoginScreen(context);
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 20, color: Color(0xFF201A30)),
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account? ', style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                    InkWell(
                      onTap: () {
                        _navigateToLoginScreen(context);
                      },
                      child: const Text(
                        'Sign up', style: TextStyle(
                          color: Color(0xFF0DF5E3),
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold
                      ),
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

void _navigateToLoginScreen(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const loginScreen()));
}

