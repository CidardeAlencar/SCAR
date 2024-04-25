//import 'package:calculadora/UI/screens/editedu_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scar/screens/editedw_screen.dart';

class ContainerWeaponRecordWidget extends StatelessWidget {
  final String lastName, grade, third;
  final user, userauth;

  ContainerWeaponRecordWidget(
      {super.key,
      required this.lastName,
      required this.grade,
      required this.third,
      required this.user,
      required this.userauth});

  @override
  Widget build(BuildContext context) {
    Future<void> _deleteWeapon(DocumentReference userRef) async {
      try {
        // Eliminar el documento completo del usuario
        await userRef.delete();
        // Mostrar un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Armamento eliminado'),
          ),
        );
      } catch (error) {
        print('Error al eliminar el armamento: $error');
        // Mostrar un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al eliminar el armamento'),
          ),
        );
      }
    }

    // Future<void> deleteUserAuth() async {
    //   try {
    //     if (userauth != null) {
    //       await userauth.delete();
    //       print('Usuario eliminado exitosamente');
    //     } else {
    //       print('No hay un usuario autenticado');
    //     }
    //   } catch (error) {
    //     print('Error al eliminar el usuario: $error');
    //   }
    // }

    void showUserDataDialog(userId) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Información de la pistola'),
            content: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('weapons')
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

                String fusil = snapshot.data!['numFusil'];
                String cerrojo = snapshot.data!['numCerrojo'];
                String cierre = snapshot.data!['numCierre'];
                String responsable = snapshot.data!['responsable'];
                String estado = snapshot.data!['estado'];
                String novedades = snapshot.data!['novedades'];
                String patrulla = snapshot.data!['patrulla'];
                //String role = snapshot.data!['role'];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fuerza: $patrulla'),
                    Text('Propietario: $responsable'),
                    Text('Número de serie: $fusil'),
                    Text('Modelo de pistola: $cerrojo'),
                    Text('Carrera: $cierre'),
                    Text('Estado: $estado'),
                    Text('Situación pistola: $novedades'),
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
                  Text(
                    third,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    lastName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                  // SizedBox.fromSize(size: Size(50, 0)),
                  // Text(
                  //   grade,
                  //   textAlign: TextAlign.right,
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 0, 0, 0),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w300),
                  // ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditedwScreen(userID: user.id),
                      ),
                    );
                    // Acción al presionar el botón de edición
                    print('Botón de edición presionado');
                  },
                ),
                SizedBox(width: 5), // Ajusta el espacio entre los iconos
                IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  iconSize: 20,
                  onPressed: () {
                    showUserDataDialog(user.id);
                    // Acción al presionar el botón de visualización
                    print('Botón de visualización presionado');
                  },
                ),
                SizedBox(width: 5), // Ajusta el espacio entre los iconos
                IconButton(
                  icon: Icon(Icons.delete),
                  iconSize: 20,
                  onPressed: () {
                    // Acción al presionar el botón de eliminación
                    print('Botón de eliminación presionado');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Eliminar pistola'),
                          content:
                              Text('¿Estás seguro de eliminar esta pistola?'),
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
                                _deleteWeapon(user.reference);
                                // deleteUserAuth();
                                //Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
