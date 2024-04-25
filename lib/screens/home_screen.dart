//import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:scar/widgets/container_green_widget.dart';

// Si es una clase empieza con mayuscula

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //static const route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double counter = 0;

  TextEditingController numberOneController = TextEditingController();
  TextEditingController numberTwoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //final floatingButtons = List<unicornbutton>();

  //NO USAR GETX
  //Provider
  //Flutter bloc
  //Cubit
  //Riverpod
  //BloC
  //Redux
  //Hoks

  void signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // El inicio de sesión fue exitoso
      User user = userCredential.user!;
      print('Usuario autenticado: ${user.uid}');

      //doble autentificacion
      //// if (user.emailVerified) {
      // El usuario ha iniciado sesión y su correo electrónico está verificado
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userSnapshot.exists) {
        String role = userSnapshot.get('role');
        final snackBar =
            SnackBar(content: Text('Usuario autentificado correctamente.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Redirigir a la pantalla correspondiente según el rol
        if (role == 'Administrador') {
          Navigator.pushReplacementNamed(context, '/admin');
        } else if (role == 'Usuario') {
          print('Es un usuario');
          print('Usuario autenticado: ${user.email}');
          Navigator.pushReplacementNamed(context, '/user');
        }
      }
      //// } else {
      ////   // El usuario no ha verificado su correo electrónico o el inicio de sesión ha fallado
      ////   final snackBar = SnackBar(content: Text('Usuario no verifico email.'));
      ////   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //// }
    } catch (e) {
      final snackBar = SnackBar(content: Text('Error al iniciar sesión.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Error al iniciar sesión: $e');
    }
  }

  bool _obscureText =
      true; // Estado para controlar la visibilidad de la contraseña
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        // title: Text(
        //   "Calculadora",
        //   style: TextStyle(
        //     color: Color.fromARGB(255, 0, 0, 0),
        //     fontSize: 36,
        //   ),
        // ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icon _close circle.png'),
            onPressed: () {
              // Add your close functionality here
              exit(0);
            },
          ),
        ],
        leadingWidth: 100,
        centerTitle: true,
        //backgroundColor: Color.fromARGB(255, 255, 255, 255)
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 0),
          //sino eliminarlo
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerGreenWidget(
                      title: 'SCAR',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 37,
                ),
                // Text(
                //   'LOGIN',
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 0, 0, 0),
                //     fontSize: 32,
                //     fontWeight: FontWeight.w800,
                //   ),
                // ),
                Container(
                  width: 180,
                  height: 180,
                  //decoration: const BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Image.asset('assets/ARR.jpg'),
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    color: Color.fromRGBO(106, 85, 53, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Contraseña",
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                          ),
                          //obscureText: true,
                        ),

                        // TextFormField(
                        //     // //controller: numberOneController,
                        //     // decoration: const InputDecoration(
                        //     //   filled: true,
                        //     //   hintText: "Nombre de usuario",
                        //     //   // icon: Icon(Icons.input_sharp,
                        //     //   //     color: const Color.fromARGB(255, 255, 255, 255),
                        //     //   //     size: 36),
                        //     //   focusColor:
                        //     //       const Color.fromARGB(255, 255, 255, 255),
                        //     // ),
                        //     // //cursorColor: const Color.fromARGB(255, 255, 255, 255),

                        //     // //keyboardType: TextInputType.number,
                        //     ),
                      ],
                      // child: Center(

                      //   child: Text(
                      //     "hola",
                      //     style: TextStyle(
                      //         color: Color.fromARGB(255, 255, 255, 255),
                      //         fontSize: 64,
                      //         fontWeight: FontWeight.w500),
                      //   ),

                      // ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    signIn();
                    print('Botón presionado');
                  },
                  child: Container(
                    width: 285,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(46, 27, 27, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Center(
                        child: Text(
                          "INGRESAR",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ContainerGreenWidget(
                //       title: 'INGRESE EL SEGUNDO NUMERO:',
                //     ),
                //     ContainerGreenWidget(
                //       title: '(ENTERO)',
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     filled: true,
                //     hintText: "Ingrese el segundo numero aqui",
                //     icon: Icon(Icons.input_sharp,
                //         color: Color(0xFFFFFFFF), size: 36),
                //   ),
                //   controller: numberTwoController,
                //   keyboardType: TextInputType.number,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          )),
      //floatingActionButton:
      //FloatingActionButton(child: Icon(Icons.add), onPressed: suma),
      //FloatingActionButton(child: Icon(Icons.minimize), onPressed: resta),
      // floatingActionButton: UnicornDialer(
      //     backgroundColor: Colors.black38,
      //     parentButtonBackground: Colors.brown,
      //     orientation: UnicornOrientation.VERTICAL,
      //     parentButton: Icon(Icons.add),
      //     childButtons: floatingButtons),
      // floatingActionButton: SpeedDial(
      //   animatedIcon: AnimatedIcons.menu_close,
      //   overlayOpacity: 0.1,
      //   spacing: 15,
      //   children: [
      //     SpeedDialChild(child: Icon(Icons.add), label: "Sumar", onTap: suma),
      //     SpeedDialChild(child: Text("-"), label: "Restar", onTap: resta),
      //     SpeedDialChild(
      //         child: Text("*"), label: "Multiplicar", onTap: multiplicacion),
      //     SpeedDialChild(child: Text("/"), label: "Dividir", onTap: divicion),
      //   ],
      // )
    );
  }
}
