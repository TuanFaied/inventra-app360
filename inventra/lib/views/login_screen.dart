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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/bg-lines.png'), // Replace with your image path
                  fit: BoxFit.none,
                  alignment: Alignment.bottomRight,
                  colorFilter: ColorFilter.mode(
                    const Color(0xffe1e4e8).withOpacity(0.5), // Replace with your desired color and opacity
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/inventra_logo.png', width: 205, height: 52), // Adjust path as necessary
                                const Text(
                                  "Sign in to your account",
                                  style: TextStyle(fontSize: 16, color: Color(0xff979797), fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _userNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    prefixIcon: Icon(Icons.email, color: Color(0xffd7d7d7)),
                                    labelStyle: TextStyle(color: Color(0xff979797)),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: kPrimaery),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: const Icon(Icons.lock, color: Color(0xffd7d7d7)),
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
                                    labelStyle: const TextStyle(color: Color(0xff979797)),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: kPrimaery),
                                    ),
                                  ),
                                  obscureText: _obscureText,
                                  textInputAction: TextInputAction.done,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: kPrimaery, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                _controller.login(context, _userNameController.text, _passwordController.text);
                              },
                              child: const Text("Sign in"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(18.0),
                                backgroundColor: kPrimaery,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PoweredByApp360(),
            ),
          ],
        ),
      ),
    );
  }
}
