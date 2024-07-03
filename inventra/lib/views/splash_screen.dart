import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventra/components/powered_by_app360.dart';
import 'login_screen.dart'; // Adjust the import based on the actual path

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
    //_navigateToLogin();
  }

  // _navigateToLogin() async {
  //   await Future.delayed(const Duration(seconds: 3), () {});
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginScreen()),
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/images/bg-lines-up.png'), // Replace with your image path
                fit: BoxFit.none,
                alignment: Alignment.topRight,
                colorFilter: ColorFilter.mode(
                  const Color(0xffe1e4e8).withOpacity(
                      0.5), // Replace with your desired color and opacity
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/images/bg-lines-inverted.png'), // Replace with your image path
                fit: BoxFit.none,
                alignment: Alignment.bottomLeft,
                colorFilter: ColorFilter.mode(
                  const Color(0xffe1e4e8).withOpacity(
                      0.5), // Replace with your desired color and opacity
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/inventra_logo.png', // Adjust path as necessary
                  width: 242,
                  height: 61,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome back! Sign in to your account",
                  style: TextStyle(
                      color: Color(0xffc4c4c4),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
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
