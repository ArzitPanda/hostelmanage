


import 'dart:convert';
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/User.dart';
import '../entity/UserInput.dart';

class FirebaseStoreImpl

{
    FirebaseFirestore _firestoreOne = FirebaseFirestore.instance;

    FirebaseFirestore get firestoreOne => _firestoreOne;




    Future<String> addUser(UserInput user) async
    {
        try
            {
                String Json = jsonEncode(user);
                Map<String, dynamic> userMap = jsonDecode(Json);
          await  firestoreOne.collection("user").add(user.toJS).then((value) => {
              print("added")

          });
          return "added";

            }
            catch(e)
        {
            return e.toString();
        }



    }


}