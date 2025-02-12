import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/core/theme.dart';
import 'package:show_trade/firebase_options.dart';
import 'package:show_trade/screens/home.dart';
import 'package:show_trade/screens/login.dart';
import 'package:show_trade/screens/signup.dart';
import 'package:show_trade/screens/splash.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
double sh = 0.0;
double sw = 0.0;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    sh = MediaQuery.of(context).size.height;
    sw = MediaQuery.of(context).size.width;
    return MaterialApp.router(
      routerConfig: router,
      title: 'show trade',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: ThemeMode.system,
    );
  }
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
  ],
);
