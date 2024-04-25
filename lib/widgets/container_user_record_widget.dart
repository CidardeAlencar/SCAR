//import 'package:calculadora/UI/screens/editedu_screen.dart';
//import 'package:calculadora/UI/screens/editedw_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scar/screens/editedu_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ContainerUserRecordWidget extends StatelessWidget {
  final String lastName, grade, third;
  final user, userauth;

  ContainerUserRecordWidget(
      {super.key,
      required this.lastName,
      required this.grade,
      required this.third,
      required this.user,
      required this.userauth});

  @override
  Widget build(BuildContext context) {
    Future<void> _deleteUser(DocumentReference userRef) async {
      try {
        // Eliminar el documento completo del usuario
        await userRef.delete();
        // Mostrar un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuario eliminado'),
          ),
        );
      } catch (error) {
        print('Error al eliminar el usuario: $error');
        // Mostrar un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al eliminar el usuario'),
          ),
        );
      }
    }

//CORREJIR VERSION AUTH DELETE

    Future<void> deleteUserAuth(String uid1) async {
      try {
        if (userauth != null) {
          await userauth.user(uid: uid1).delete();
          print('Usuario eliminado exitosamente');
        } else {
          print('No hay un usuario autenticado');
        }
      } catch (error) {
        print('Error al eliminar el usuario: $error');
      }
    }

//
    void showUserDataDialog(userId) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Información del usuario'),
            content: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error al obtener los datos del usuario');
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text('No se encontró el usuario en Cloud Firestore');
                }

                // Accede a los campos de los datos del usuario

                String email = snapshot.data!['email'];
                String flastname = snapshot.data!['flastname'];
                String grade = snapshot.data!['grade'];
                String name = snapshot.data!['name'];
                String slastname = snapshot.data!['slastname'];
                String role = snapshot.data!['role'];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: $email'),
                    Text('Nombre: $name'),
                    Text('Apellido Paterno: $flastname'),
                    Text('Apellido Materno: $slastname'),
                    Text('Grado: $grade'),
                    Text('Rol: $role'),
                  ],
                );
              },
            ),
            actions: [
              TextButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      //width: 285,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(30),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   third,
                  //   textAlign: TextAlign.right,
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 0, 0, 0),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w300),
                  // ),
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    lastName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                  // SizedBox.fromSize(size: Size(50, 0)),
                  Text(
                    grade,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditeduScreen(userID: user.id),
                          ),
                        );

                        // Acción al presionar el botón de edición
                        print('Botón de edición presionado');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        showUserDataDialog(user.id);
                        // Acción al presionar el botón de edición
                        print('Botón de visualizar presionado');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Acción al presionar el botón de edición
                        print('Botón de eliminar presionado');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Eliminar usuario'),
                              content: Text(
                                  '¿Estás seguro de eliminar este usuario?'),
                              actions: [
                                TextButton(
                                  child: Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Eliminar'),
                                  onPressed: () {
                                    // Eliminar el documento de Cloud Firestore
                                    // FirebaseFirestore.instance
                                    //     .collection('users')
                                    //     .doc(user.id)
                                    //     .delete();
                                    Navigator.of(context).pop();
                                    _deleteUser(user.reference);
                                    //deleteUserAuth(user.id);
                                    //Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
