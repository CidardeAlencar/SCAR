import 'package:flutter/material.dart';

class ContainerGreenWidget extends StatelessWidget {
  final String title;
  ContainerGreenWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromRGBO(106, 85, 53, 1),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            offset: Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 64,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
