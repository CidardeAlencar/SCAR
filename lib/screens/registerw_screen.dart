//import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scar/widgets/container_green_widget.dart';
//import 'package:firebase_core/firebase_core.dart';

// Si es una clase empieza con mayuscula
const List<String> list = <String>['Regular', 'Bueno', 'Malo'];
const List<String> pat = <String>['EJTO', 'AB', 'FAB'];
const List<String> mod = <String>[
  'NORINCO NP22',
  'GLOCK 17',
  'STEYR L9-A1',
  'CZ P-07',
  'TAURUS PT92',
  'P250 SIG SAUER'
];
const List<String> car = <String>[
  'Ing. Civil',
  'Ing. Geográfica',
  'Ing. Sistemas Electrónicos',
  'Ing. Industrial',
  'Ing. Comercial',
  'Ing. Sistemas',
  'Ing. Ambiental',
  'Ing. Petrolera',
  'Ing. Mecatrónica',
  'Ing. Telecomunicaciones'
];
const List<String> sit = <String>[
  'Sin dotación',
  'Dotación',
  'Reposición',
  'Resarcimiento',
  'Extravío/robo',
  'Comisión',
  'Custodio'
];

class RegisterwScreen extends StatefulWidget {
  const RegisterwScreen({Key? key}) : super(key: key);

  //static const route = '/';

  @override
  State<RegisterwScreen> createState() => _RegisterwScreenState();
}

class _RegisterwScreenState extends State<RegisterwScreen> {
  String _selectedOption = list.first;
  String _selectedOption2 = pat.first;
  String _selectedOption3 = mod.first;
  String _selectedOption4 = car.first;
  String _selectedOption5 = sit.first;

  TextEditingController numFusilController = TextEditingController();
  TextEditingController numCerrojoController = TextEditingController();
  TextEditingController numCierreController = TextEditingController();
  TextEditingController novedadesController = TextEditingController();
  TextEditingController responsableController = TextEditingController();
  void _adminUser(BuildContext context) async {
    try {
      //await _auth.signOut();
      Navigator.pushReplacementNamed(context, '/adminWeapons');
    } catch (e) {
      print('Error: $e');
    }
  }

  void signUp() async {
    String fusil = numFusilController.text;
    // String cerrojo = numCerrojoController.text;
    // String cierre = numCierreController.text;
    // String novedades = novedadesController.text;
    String responsable = responsableController.text;

    try {
      // UserCredential userCredential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // // El inicio de sesión fue exitoso
      // User user = userCredential.user!;
      // print('Usuario creado en auth: ${user.uid}');

      // // Consultar el rol del usuario en la base de datos
      // DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(user.uid)
      //     .get();
      // if (userSnapshot.exists) {
      //   String role = userSnapshot.get('role');

      //   // Redirigir a la pantalla correspondiente según el rol
      //   if (role == 'admin') {
      //     Navigator.pushReplacementNamed(context, '/admin');
      //   } else if (role == 'user') {
      //     print('Es un usuario');
      //     print('Usuario autenticado: ${user.email}');
      //     Navigator.pushReplacementNamed(context, '/user');
      //   }
      // }
      // Guardar datos adicionales en Cloud Firestore
      CollectionReference weaponsCollection =
          FirebaseFirestore.instance.collection('weapons');
      DocumentReference newWeaponDocRef = weaponsCollection.doc();
      newWeaponDocRef.set({
        'numFusil': fusil,
        'numCerrojo': _selectedOption3,
        'numCierre': _selectedOption4,
        'novedades': _selectedOption5,
        'estado': _selectedOption,
        'responsable': responsable,
        'patrulla': _selectedOption2
      });
      print('Se registaron los datos');
      // Mostrar mensaje de éxito
      _adminUser(context);
      final snackBar =
          SnackBar(content: Text('Datos guardados correctamente.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      // Ocurrió un error durante el inicio de sesión
      print('Error al iniciar sesión: $e');
      final snackBar = SnackBar(content: Text('Error al guardar: $e'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  // void signIn() async {
  //   String email = emailController.text;
  //   String password = passwordController.text;

  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // El inicio de sesión fue exitoso
  //     User user = userCredential.user!;
  //     print('Usuario autenticado: ${user.uid}');
  //     //Navigator.pushReplacementNamed(context, '/admin');
  //     // Consultar el rol del usuario en la base de datos
  //     DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .get();
  //     if (userSnapshot.exists) {
  //       String role = userSnapshot.get('role');

  //       // Redirigir a la pantalla correspondiente según el rol
  //       if (role == 'admin') {
  //         Navigator.pushReplacementNamed(context, '/admin');
  //       } else if (role == 'user') {
  //         print('Es un usuario');
  //         print('Usuario autenticado: ${user.email}');
  //         Navigator.pushReplacementNamed(context, '/user');
  //       }
  //     }
  //   } catch (e) {
  //     // Ocurrió un error durante el inicio de sesión
  //     print('Error al iniciar sesión: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
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
          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     ContainerGreenWidget(
              //       title: 'TOP CHARTS',
              //     ),
              //     ContainerGreenWidget(
              //       title: 'GAMES',
              //     ),
              //     ContainerGreenWidget(
              //       title: 'CATEGORIES',
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              //Container(
              // width: 300,
              // height: 200,
              //decoration: const BoxDecoration(color: Colors.white),
              // child: Stack(
              //   children: [
              //     Image.network(
              //       'https://static.vecteezy.com/system/resources/previews/007/168/305/non_2x/realistic-math-chalkboard-background-illustration-free-vector.jpg',
              //     ),
              //   ],
              // ),
              //),

              // const SizedBox(
              //   height: 15,
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ContainerGreenWidget(
              //       title: 'INGRESE EL PRIMER NUMERO:',
              //     ),
              //     ContainerGreenWidget(
              //       title: '(ENTERO)',
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreenWidget(
                    title: 'SCAR',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'REGISTRO DE PISTOLA',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              // Container(
              //   width: 150,
              //   height: 150,
              //   //decoration: const BoxDecoration(color: Colors.white),
              //   child: Stack(
              //     children: [
              //       Image.asset('assets/ARR.jpg'),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              //Expanded(
              //child:
              Container(
                //height: 270,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top -
                    100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    //bottomRight: Radius.circular(100),
                  ),
                  color: Color.fromRGBO(106, 85, 53, 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        child: TextFormField(
                          controller: numFusilController,
                          decoration: InputDecoration(
                            hintText: "Numero de Serie",
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   height: 48,
                      //   child: TextFormField(
                      //     controller: numCerrojoController,
                      //     decoration: InputDecoration(
                      //       hintText: "Modelo",
                      //       filled: true,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30)),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        //color: Colors.white,
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 145, 50, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton<String>(
                          //hint: Text('Tipo de usuario'),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          isExpanded: true,
                          value: _selectedOption3,
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption3 = newValue!;
                            });
                          },
                          items: mod
                              .map<DropdownMenuItem<String>>((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   height: 48,
                      //   child: TextFormField(
                      //     controller: numCierreController,
                      //     decoration: InputDecoration(
                      //       hintText: "Carrera",
                      //       filled: true,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30)),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        //color: Colors.white,
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 145, 50, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton<String>(
                          //hint: Text('Tipo de usuario'),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          isExpanded: true,
                          value: _selectedOption4,
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption4 = newValue!;
                            });
                          },
                          items: car
                              .map<DropdownMenuItem<String>>((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 48,
                        child: TextFormField(
                          controller: responsableController,
                          decoration: InputDecoration(
                            hintText: "Propietario",
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // SingleChildScrollView(
                      //   //height: 100,
                      //   child: Container(
                      //     height: 80,
                      //     child: TextField(
                      //       //keyboardType: TextInputType.multiline,
                      //       // Permite múltiples líneas
                      //       maxLines: null,
                      //       // Permite que el TextField tenga un número ilimitado de líneas
                      //       expands: true,
                      //       // Permite que el TextField se expanda para adaptarse al contenido
                      //       controller: novedadesController,
                      //       decoration: InputDecoration(
                      //         hintText: "Situación pistola",
                      //         filled: true,
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30)),
                      //         // contentPadding: EdgeInsets.symmetric(
                      //         //     vertical: 50, horizontal: 15),
                      //         // Ajusta la altura del TextField
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        //color: Colors.white,
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 145, 50, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton<String>(
                          //hint: Text('Tipo de usuario'),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          isExpanded: true,
                          value: _selectedOption5,
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption5 = newValue!;
                            });
                          },
                          items: sit
                              .map<DropdownMenuItem<String>>((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   height: 48,
                      //   child: TextFormField(
                      //     controller: gradeController,
                      //     decoration: InputDecoration(
                      //       hintText: "Grado",
                      //       filled: true,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30)),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   height: 48,
                      //   child: TextFormField(
                      //     controller: passwordController,
                      //     decoration: InputDecoration(
                      //       hintText: "Contraseña",
                      //       filled: true,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30)),
                      //     ),
                      //     obscureText: true,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   height: 48,
                      Container(
                        //color: Colors.white,
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 145, 50, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton<String>(
                          //hint: Text('Tipo de usuario'),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          isExpanded: true,
                          value: _selectedOption,
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption = newValue!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                        ),
                      ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        //color: Colors.white,
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 145, 50, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton<String>(
                          //hint: Text('Tipo de usuario'),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          isExpanded: true,
                          value: _selectedOption2,
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption2 = newValue!;
                            });
                          },
                          items: pat
                              .map<DropdownMenuItem<String>>((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                        ),
                      ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),

                      InkWell(
                        onTap: () {
                          // Acción al presionar el botón
                          signUp();
                          print('Botón guardar presionado');
                          // Agrega aquí la lógica adicional que deseas ejecutar al presionar el botón
                        },
                        child: Container(
                          width: 285,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(46, 27, 27, 1),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Center(
                              child: Text(
                                "GUARDAR",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      InkWell(
                        onTap: () {
                          // Acción al presionar el botón
                          _adminUser(context);
                          print('Botón volver presionado');
                          // Agrega aquí la lógica adicional que deseas ejecutar al presionar el botón
                        },
                        child: Container(
                          width: 285,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(46, 27, 27, 1),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Center(
                              child: Text(
                                "VOLVER",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
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
              //),
              // const SizedBox(
              //   height: 30,
              // ),

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
        ),
      ),
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
