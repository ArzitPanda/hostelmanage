import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/FireRepo/FireAuth.dart';


class ProfileScreen extends StatelessWidget {




 ProfileScreen({super.key});







  @override
  Widget build(BuildContext context) {

    User? a = FirebaseAuth.instance.currentUser;
    return Container(child: Center(child: Text(a!.email.toString())),);
  }
}
