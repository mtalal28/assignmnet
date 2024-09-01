import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'SplashScreen.dart';
import 'SignInPage.dart';
import 'home.dart';
import 'signup.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()), // Providing AuthProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'first',
      routes: {
        'first': (context) => const SplashScreen(),
        'signIn': (context) => const SignInPage(),
        '/signup': (context) => const Signup(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
