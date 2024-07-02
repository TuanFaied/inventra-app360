import 'package:flutter/material.dart';
import 'package:inventra/components/powered_by_app360.dart';
import 'package:inventra/constants.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = LoginController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/inventra_logo.png', width: 205, height: 52), // Adjust path as necessary
                            Text(
                              "Sign in to your account",
                              style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 49),
                      TextField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email, color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaery),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: kPrimaery,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaery),
                          ),
                        ),
                        obscureText: _obscureText,
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: kPrimaery, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _controller.login(context, _userNameController.text, _passwordController.text);
                          },
                          child: Text("Sign in"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(18.0),
                            backgroundColor: kPrimaery,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Added space to make room for "Powered by APP360"
                    ],
                  ),
                ),
              ),
            ),
            PoweredByApp360(),
          ],
        ),
      ),
    );
  }
}
