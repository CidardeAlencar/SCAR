//import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scar/widgets/container_green_widget.dart';
// Si es una clase empieza con mayuscula

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print('Error: $e');
    }
  }

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
                height: 37,
              ),
              // Text(
              //   'ADMINISTRADOR',
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
                width: 411,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: Color.fromRGBO(106, 85, 53, 1),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color:
                  //         const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  //     offset: Offset(0, 3),
                  //     blurRadius: 6,
                  //     spreadRadius: 2,
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Acción al presionar el botón
                          print('Botón usuarios');
                          Navigator.pushNamed(context, '/adminUsers');
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
                                vertical: 10, horizontal: 15),
                            child: Center(
                              child: Text(
                                "USUARIOS",
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
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          // Acción al presionar el botón
                          print('Botón armamento');
                          // Agrega aquí la lógica adicional que deseas ejecutar al presionar el botón
                          Navigator.pushNamed(context, '/adminWeapons');
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
                                vertical: 10, horizontal: 15),
                            child: Center(
                              child: Text(
                                "ARMAMENTO",
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

              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  // Acción al presionar el botón
                  _signOut(context);
                  print('Botón cerrar sesion');
                  // Agrega aquí la lógica adicional que deseas ejecutar al presionar el botón
                },
                child: Container(
                  width: 285,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(46, 27, 27, 1),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Center(
                      child: Text(
                        "CERRAR SESION",
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
