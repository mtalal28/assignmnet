import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'signIn');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CB',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color:Color(0xFFD6B560),
                fontFamily: 'Cursive',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'CONCIERGE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'BOOKINGS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFD6B560),
                letterSpacing: 5.0,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
