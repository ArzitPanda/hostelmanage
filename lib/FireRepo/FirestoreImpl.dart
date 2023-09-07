


import 'dart:convert';


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
          await  firestoreOne.collection("user").add(user.toJson()).then((value) => {
              print("added")

          });
          return "added";

            }
            catch(e)
        {
            return e.toString();
        }



    }

    void getUsers()
    {
    List<UserInput> user = [];
    FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      String Json = jsonEncode(doc.data());
      Map<String, dynamic> userMap = jsonDecode(Json);

      UserInput a = UserInput.fromJson(userMap);
      user.add(a);

    });

    });
    print(user.toString());



}


}