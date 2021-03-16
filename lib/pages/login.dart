import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home.dart';
import './signup.dart';
import '../commons/loading.dart';
import '../commons/common.dart';
import '../db/auth.dart';
import '../db/users.dart';
import '../provider/user_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Auth auth = Auth();
  UserServices _userServices = UserServices();

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  
  bool loading = false;
  bool isLogedin = false;

  /*@override
  void initState() {
    super.initState();
   // isSignedIn();
  }*/

  /*void isSignedIn() async {
    setState(() {
      loading = true;
    });

   /* await firebaseAuth.currentUser().then((user) {
      if (user != null) {
        setState(() => isLogedin = true);
      }
    });*/
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }*/

//  Future handleSignIn() async {
//    setState(() {
//      loading = true;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    final user= Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body:user.status==Status.Authenticating ? Loading(): ListView(
      //  body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'images/cart.png',
                  width: 120.0,
//                height: 240.0,
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[350],
                          blurRadius: 20.0,
                        )
                      ]),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.2),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    icon: Icon(Icons.alternate_email),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.2),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _passwordTextController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: deepOrange,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () async{
                                    if(_formKey.currentState.validate()) {
                                          if(! await user.signIn(_emailTextController.text, _passwordTextController.text)){
                                            _key.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));
                                          }
                                        }
                                                                      },
                                                                      minWidth: MediaQuery.of(context).size.width,
                                                                      child: Text(
                                                                        "Login",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 20.0),
                                                                      ),
                                                                    )),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      "Forgot password",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: black,
                                                                        fontWeight: FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: InkWell(
                                                                          onTap: () {
                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (context) =>
                                                                                        SignUp()));
                                                                          },
                                                                          child: Text(
                                                                            "Create an account",
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(color: black),
                                                                          ))),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.all(16.0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: <Widget>[
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Divider(),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Text(
                                                                        "Or",
                                                                        style: TextStyle(
                                                                            fontSize: 20, color: Colors.grey),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Divider(
                                                                        color: black,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(
                                                                        14.0, 8.0, 14.0, 8.0),
                                                                    child: Material(
                                                                        child: MaterialButton(
                                                                            onPressed: () {},
                                                                            child: Image.asset(
                                                                              "images/fb.png",
                                                                              width: 60,
                                                                            ))),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(
                                                                        14.0, 8.0, 14.0, 8.0),
                                                                    child: Material(
                                                                        child: MaterialButton(
                                                                            onPressed: () async {
                                                                              FirebaseUser user =
                                                                                  await auth.googleSignIn();
                                                                              _userServices.createUsers(
                                                                                name: user.displayName,
                                                                                photo: user.photoUrl,
                                                                                email: user.email,
                                                                                userId: user.uid,
                                                                              );
                                                                              changeScreenReplacemente(
                                                                                  context, HomePage());
                                                                            },
                                                                            child: Image.asset(
                                                                              "images/ggg.png",
                                                                              width: 60,
                                                                            ))),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: loading ?? true,
                                                child: Center(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    color: Colors.white.withOpacity(0.9),
                                                    child: CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                    
}
