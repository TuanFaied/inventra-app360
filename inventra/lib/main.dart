import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inventra/views/login_screen.dart';
import 'package:inventra/views/route_selection_screen.dart';
import 'package:inventra/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/routeSelection': (context) => RouteSelectionScreen(),
      },
    );
  }
}


