import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:inventra/models/route_model.dart';
import 'package:inventra/models/user.dart';
import 'package:inventra/views/dashboard_screen.dart';
import 'package:inventra/views/login_screen.dart';
import 'package:inventra/views/report_screen.dart';
import 'package:inventra/views/route_selection_screen.dart';
import 'package:inventra/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/routeSelection',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final user = extra['user'] as User;
          final routes = extra['routes'] as List<Routes>;
          return RouteSelectionScreen(user: user, routes: routes);
        },
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final user = extra['user'] as User;
          final route = extra['route'] as Routes;
          return DashboardScreen(user: user, route: route);
        },
      ),

      

    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/login': (context) => LoginScreen(),
      //   '/routeSelection': (context) => RouteSelectionScreen(),
      //   '/dashboard': (context) => DashboardScreen(),
      //   '/report': (context) => ReportScreen(),
      // },
    );
  }
}
