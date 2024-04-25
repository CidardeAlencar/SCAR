import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class UnityDemoScreen extends StatefulWidget {
  final String weapoID;
  const UnityDemoScreen({Key? key, required this.weapoID}) : super(key: key);

  @override
  State<UnityDemoScreen> createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<UnityDemoScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    void showUserDataDialog(userId) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Información del Armamento'),
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
                String estado = snapshot.data!['estado'];
                String novedades = snapshot.data!['novedades'];
                String responsable = snapshot.data!['responsable'];
                String patrulla = snapshot.data!['patrulla'];
                //String role = snapshot.data!['role'];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Patrulla: $patrulla'),
                    Text('Responsable: $responsable'),
                    Text('Número de fusil: $fusil'),
                    Text('Número de cerrojo: $cerrojo'),
                    Text('Número de cierre: $cierre'),
                    Text('Estado: $estado'),
                    Text('Novedades: $novedades'),
                    //Text('Rol: $role'),
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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        title: Text(
          "ACS-AR",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          IconButton(
            icon: Image.asset('assets/icon _info circle.png'),
            onPressed: () {
              // Add your close functionality here
              //exit(0);
              //showUserDataDialog('5j4qcd9NIRzGGKly5Y1f');
              showUserDataDialog(widget.weapoID);
            },
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
            icon: Image.asset('assets/icon _arrow circle right.png'),
            onPressed: () {
              // Add your close functionality here

              Navigator.pushReplacementNamed(context, '/user');
              //Navigator.pop(context);
            },
          ),
          const SizedBox(
            width: 30,
          ),
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
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () async {
            // Pop the category page if Android back button is pressed.
            return true;
          },
          child: Container(
            color: Colors.yellow,
            child: UnityWidget(
              onUnityCreated: onUnityCreated,
            ),
          ),
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }
}
