import 'package:flutter/material.dart';
import 'package:inventra/components/powered_by_app360.dart';
import 'login_screen.dart'; // Adjust the import based on the actual path

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/inventra_logo.png', // Adjust path as necessary
                  width: 242,
                  height: 61,
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome back! Sign in to your account",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PoweredByApp360(),
          ),
        ],
      ),
    );
  }
}
