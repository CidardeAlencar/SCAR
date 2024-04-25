//import 'package:ascar/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(106, 85, 53, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 180),
            const SizedBox(height: 11),
            Text(
              'SCAR',
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      blurRadius: 10,
                      offset: Offset(4, 7),
                    ),
                  ],
                  fontSize: 96,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -15,
                  //color: Color.fromRGBO(210, 190, 105, 1)),
                  color: Color.fromRGBO(168, 142, 95, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
