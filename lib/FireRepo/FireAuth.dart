


import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_management/FireRepo/FirestoreImpl.dart';
import 'package:hostel_management/entity/UserInput.dart';

class FireAuth
{

  get auth => FirebaseAuth.instance;

  Future<String> signup(UserInput a) async
  {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: a.mail,
          password: a.password
      );

      String? authemail = userCredential.user?.email;




      return "sucessfully inserted";

    } catch (e) {
      print(e);
      return 'something went wrong';
    }


  }






}