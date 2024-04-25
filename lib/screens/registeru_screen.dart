//import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scar/widgets/container_green_widget.dart';
//import 'package:firebase_core/firebase_core.dart';

// Si es una clase empieza con mayuscula
const List<String> list = <String>['Usuario', 'Administrador'];

class RegisteruScreen extends StatefulWidget {
  const RegisteruScreen({Key? key}) : super(key: key);

  //static const route = '/';

  @override
  State<RegisteruScreen> createState() => _RegisteruScreenState();
}

class _RegisteruScreenState extends State<RegisteruScreen> {
  String _selectedOption = list.first;
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController flastnameController = TextEditingController();
  TextEditingController slastnameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController kuserController = TextEditingController();

  void _adminUser(BuildContext context) async {
    try {
      //await _auth.signOut();
      //Navigator.pushReplacementNamed(context, '/adminUsers');
      Navigator.pop(context);
    } catch (e) {
      print('Error: $e');
    }
  }

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String name = nameController.text;
    String flastname = flastnameController.text;
    String slastname = slastnameController.text;
    String grade = gradeController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //doble verificacion
      await userCredential.user!.sendEmailVerification();
      // El inicio de sesión fue exitoso
      User user = userCredential.user!;
      print('Usuario creado en auth: ${user.uid}');
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
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = usersCollection.doc(user.uid);
      userDocRef.set({
        'email': email,
        'name': name,
        'flastname': flastname,
        'slastname': slastname,
        'grade': grade,
        'password': password,
        'role': _selectedOption,
      });
      print('Se registaron los datos');
      // Mostrar mensaje de éxito
      // Navigator.of(context).pop();
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
              'REGISTRO DE USUARIOS',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
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
            const SizedBox(
              height: 10,
            ),
            //Expanded(
            //child:
            Container(
              //height: 270,
              // constraints: BoxConstraints(
              //   maxHeight:
              //       double.infinity, // Establece una altura máxima infinita
              // ),
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  150,
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
                      height: 40,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Nombre",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        controller: flastnameController,
                        decoration: InputDecoration(
                          hintText: "Apellido Paterno",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        controller: slastnameController,
                        decoration: InputDecoration(
                          hintText: "Apellido Materno",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        controller: gradeController,
                        decoration: InputDecoration(
                          hintText: "Grado",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        obscureText: _obscureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Contraseña",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
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
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   height: 48,
                    Container(
                      //color: Colors.white,
                      width: 310,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 180, 160, 183),
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
                        items:
                            list.map<DropdownMenuItem<String>>((String option) {
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
        )),
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
