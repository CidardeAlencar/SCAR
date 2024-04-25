//import 'dart:ffi';
import 'dart:io';
//import 'package:calculadora/UI/widgets/container_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:scar/widgets/container_green_widget.dart';
import 'package:scar/widgets/container_prueba.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:firebase_auth/firebase_auth.dart';
// Si es una clase empieza con mayuscula
//  import 'package:cloud_firestore/cloud_firestore.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  // List<QueryDocumentSnapshot<Object?>> users = [];
  void _admin(BuildContext context) async {
    try {
      //await _auth.signOut();
      //Navigator.pushReplacementNamed(context, '/admin');
      Navigator.pop(context);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<List<QueryDocumentSnapshot<Object?>>> getUsersData() async {
  //   QuerySnapshot<Object?> querySnapshot =
  //       await FirebaseFirestore.instance.collection('users').get();
  //   return querySnapshot.docs.cast<QueryDocumentSnapshot<Object?>>();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getUsersData().then((data) {
  //     setState(() {
  //       users = data;
  //     });
  //   });
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
                height: 22,
              ),
              Container(
                //decoration: const BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Image.asset('assets/icon _user.png'),
                  ],
                ),
              ),
              Text(
                'USUARIOS',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      // bottomRight: Radius.circular(100),
                    ),
                    color: Color.fromRGBO(106, 85, 53, 1),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Acción al presionar el botón
                          print('Botón registro de usuario');
                          Navigator.pushNamed(context, '/registerUsers');
                          // Agrega aquí la lógica adicional que deseas ejecutar al presionar el botón
                        },
                        child: Container(
                          width: 415,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
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
                                vertical: 30, horizontal: 15),
                            child: Center(
                              child: Text(
                                "REGISTRAR USUARIO",
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
                        height: 20,
                      ),
                      // ListView(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        width: 380,
                        height: 280,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  //width: 415,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    color: Color.fromRGBO(46, 27, 27, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Ap.Paterno",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "Grado",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          width: 120,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                UserListWidget(),
                                // StreamBuilder<QuerySnapshot>(
                                //     stream: FirebaseFirestore.instance
                                //         .collection('users')
                                //         .snapshots(),
                                //     builder: (context, snapshot) {
                                //       if (!snapshot.hasData) {
                                //         return CircularProgressIndicator();
                                //       }
                                //       final users = snapshot.data!.docs;
                                //       return ListView.builder(
                                //         itemCount: users.length,
                                //         itemBuilder: (context, index) {
                                //           final user = users[index];
                                //           final name = user['name'] as String;
                                //           final email = user['email'] as String;

                                //           return Container(
                                //             margin: EdgeInsets.all(8.0),
                                //             padding: EdgeInsets.all(16.0),
                                //             decoration: BoxDecoration(
                                //               border: Border.all(),
                                //               borderRadius:
                                //                   BorderRadius.circular(8.0),
                                //             ),
                                //             child: Column(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Text('Nombre: $name'),
                                //                 Text('Email: $email'),
                                //               ],
                                //             ),
                                //           );
                                //         },
                                //       );
                                //     }),
                                // Container(
                                //   //padding: const EdgeInsets.symmetric(
                                //   //  vertical: 0, horizontal: 0),
                                //   child: Column(
                                //     //mainAxisAlignment:
                                //     //  MainAxisAlignment.spaceBetween,
                                //     //crossAxisAlignment: CrossAxisAlignment.baseline,
                                //     children: [
                                //       ContainerRecordWidget(
                                //           lastName: 'de Alencar', grade: 'Mayor'),
                                //       ContainerRecordWidget(
                                //           lastName: 'Flores', grade: 'Mayor'),
                                //       ContainerRecordWidget(
                                //           lastName: 'Flores', grade: 'Mayor'),
                                //       ContainerRecordWidget(
                                //           lastName: 'Flores', grade: 'Mayor'),
                                //       ContainerRecordWidget(
                                //           lastName: 'Flores', grade: 'Mayor'),
                                //       ContainerRecordWidget(
                                //           lastName: 'Oyola', grade: 'Menor'),
                                //       // const SizedBox(
                                //       //   height: 50,
                                //       // ),

                                //       // TextFormField(
                                //       //     // //controller: numberOneController,
                                //       //     // decoration: const InputDecoration(
                                //       //     //   filled: true,
                                //       //     //   hintText: "Nombre de usuario",
                                //       //     //   // icon: Icon(Icons.input_sharp,
                                //       //     //   //     color: const Color.fromARGB(255, 255, 255, 255),
                                //       //     //   //     size: 36),
                                //       //     //   focusColor:
                                //       //     //       const Color.fromARGB(255, 255, 255, 255),
                                //       //     // ),
                                //       //     // //cursorColor: const Color.fromARGB(255, 255, 255, 255),

                                //       //     // //keyboardType: TextInputType.number,
                                //       //     ),
                                //     ],
                                //     // child: Center(

                                //     //   child: Text(
                                //     //     "hola",
                                //     //     style: TextStyle(
                                //     //         color: Color.fromARGB(255, 255, 255, 255),
                                //     //         fontSize: 64,
                                //     //         fontWeight: FontWeight.w500),
                                //     //   ),

                                //     // ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          // Acción al presionar el botón
                          _admin(context);
                          print('Botón volver');
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
                    ],
                  ),
                ),
              ),

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
