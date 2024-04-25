//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:scar/screens/admin_screen.dart';
import 'package:scar/screens/entry_screen.dart';
import 'package:scar/screens/home_screen.dart';

// import 'package:ascar/UI/screens/admin_screen.dart';
// import 'package:ascar/UI/screens/entry_screen.dart';
// // import 'package:ascar/UI/screens/doubleauth_screen.dart';
// // import 'package:calculadora/UI/screens/editedu_screen.dart';
// import 'package:ascar/UI/screens/home_screen.dart';
// import 'package:ascar/UI/screens/qr_screen.dart';
// import 'package:ascar/UI/screens/registeru_screen.dart';
// import 'package:ascar/UI/screens/registerw_screen.dart';
// //import 'package:calculadora/UI/screens/unity_screen.dart';
// import 'package:ascar/UI/screens/user_screen.dart';
// import 'package:ascar/UI/screens/weapon_screen.dart';
// //import 'package:calculadora/UI/widgets/container_prueba.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scar/screens/qr_screen.dart';
import 'package:scar/screens/registeru_screen.dart';
import 'package:scar/screens/registerw_screen.dart';
import 'package:scar/screens/user_screen.dart';
import 'package:scar/screens/weapon_screen.dart';
import 'firebase_options.dart';

void main() async {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCAR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => EntryScreen(),
        '/home': (context) => HomeScreen(),
        '/admin': (context) => AdminScreen(),
        '/user': (context) => QRViewExample(),
        '/adminUsers': (context) => UserScreen(),
        '/registerUsers': (context) => RegisteruScreen(),
        '/adminWeapons': (context) => WeaponScreen(
              onItemSelected: (selectedItem) {
                print('Selected Item: $selectedItem');
              },
            ),
        '/registerWeapons': (context) => RegisterwScreen(),
      },
      //home: HomeScreen(),
      //home: AdminScreen(),
    );
  }
}

//BORRAR
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
