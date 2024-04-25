//editarrrrrr
//import 'package:calculadora/UI/screens/weapon_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scar/widgets/container_weapon_record_widget.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class WeaponListWidget extends StatefulWidget {
  final String filter;
  WeaponListWidget({super.key, required this.filter});

  @override
  State<WeaponListWidget> createState() => _WeaponListWidgetState();
}

class _WeaponListWidgetState extends State<WeaponListWidget> {
  @override
  Widget build(BuildContext context) {
    //WeaponScreen weaponScreen = WeaponScreen();
    //TextEditingController searchController = weapo  nScreen.searchController;
    return
        //Scaffold(
        // appBar: AppBar(
        //   title: Text('User Data'),
        // ),
        //body:
        StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('weapons').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        final weapons = snapshot.data!.docs;
        //
        final filteredWeapons = weapons.where((weapon) {
          final data = weapon.data() as Map<String, dynamic>;
          final patFilter =
              data.containsKey('patrulla') ? data['patrulla'] as String : '';
          //final filterText = widget.filter;

          return patFilter.contains(widget.filter);
        }).toList();
        //

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          //itemCount: weapons.length,
          itemCount: filteredWeapons.length,
          itemBuilder: (context, index) {
            final weapon = filteredWeapons[index];
            //final weapon = weapons[index];
            final data = weapon.data() as Map<String, dynamic>;
            //final userauth = FirebaseAuth.instance.currentUser;
            final numFusil =
                data.containsKey('numFusil') ? data['numFusil'] as String : '';
            final numCerrojo = data.containsKey('numCerrojo')
                ? data['numCerrojo'] as String
                : '';
            final numCierre = data.containsKey('numCierre')
                ? data['numCierre'] as String
                : '';

            return Container(
              // margin: EdgeInsets.all(8.0),
              // padding: EdgeInsets.all(16.0),
              // decoration: BoxDecoration(
              //   border: Border.all(),
              //   borderRadius: BorderRadius.circular(8.0),
              // ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerWeaponRecordWidget(
                    lastName: '$numCerrojo',
                    grade: '$numCierre',
                    third: '$numFusil',
                    user: weapon,
                    userauth: null,
                  ),
                  // Text('Nombre: $name'),
                  // Text('Email: $email'),
                ],
              ),
            );
          },
        );
      },
    );
    //);
  }
}
