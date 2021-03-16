import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  createUsers({String name, String photo, String email, String userId}) {
    _firestore.collection(collection).document(userId).setData({
      'name': name,
      'photo': photo,
      'email': email,
      'userId': userId,
    });
  }
}
