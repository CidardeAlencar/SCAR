// import 'package:calculadora/UI/widgets/container_weapon_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scar/widgets/container_user_record_widget.dart';

class UserListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //Scaffold(
        // appBar: AppBar(
        //   title: Text('User Data'),
        // ),
        //body:
        StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        final users = snapshot.data!.docs;

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final data = user.data() as Map<String, dynamic>;
            final userauth = FirebaseAuth.instance.currentUser;

            final name = data.containsKey('flastname')
                ? data['flastname'] as String
                : '';
            final email =
                data.containsKey('grade') ? data['grade'] as String : '';

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
                  ContainerUserRecordWidget(
                    lastName: '$name',
                    grade: '$email',
                    third: '',
                    user: user,
                    userauth: userauth,
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
