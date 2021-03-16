import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../db/users.dart';


enum Status{Uninitialiazed,Authenticated,Authenticating,Unauthenticated}

class UserProvider with ChangeNotifier{
  FirebaseUser _user;
  FirebaseAuth _auth;
  Status _status=Status.Uninitialiazed;
  UserServices _userServices= UserServices();
  
   UserProvider.instance() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }
  Status get status => _status;
  FirebaseUser get user=> _user;

  /*void _onStateChanged(FirebaseUser event){

  }*/

  Future<bool> signIn(String email, String password) async{
    try{
         _status= Status.Authenticating;
         notifyListeners();
         await _auth.signInWithEmailAndPassword(email: email, password: password);
         return true;

    } catch(e){
          _status= Status.Unauthenticated;
          notifyListeners();
          print(e.toString());
          return false;
    }

  }

  Future<bool> signUp(String name, String email, String password) async{
    try{
         _status= Status.Authenticating;
        
         await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
          _userServices.createUsers( name: name,
                    email: email,
                    userId: _user.uid,);
         });
          notifyListeners();
         return true;

    } catch(e){
          _status= Status.Unauthenticated;
          notifyListeners();
          print(e.toString());
          return false;
    }

  }

  Future signOut() async{
     _auth.signOut();
     _status=Status.Unauthenticated;
      notifyListeners();
      return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(FirebaseUser user) async{
           if(user==null) {
              print("user es nuuuuulll");
             _status=Status.Unauthenticated;
           } else {
               print("hay un usuaario");
              _user=user;
              _status= Status.Authenticated;
           }
           notifyListeners();
  }

}