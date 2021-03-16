import 'package:demoecommerce/commons/common.dart';
import 'package:demoecommerce/db/auth.dart';
import 'package:demoecommerce/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/users.dart';
import '../home.dart';
import '../commons/loading.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  UserServices _userServices = UserServices();
  SharedPreferences preferences;
  
  bool loading = false;
  bool hidePass = true;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status==Status.Authenticating ? Loading():  Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  'images/cart.png',
                                  width: 120.0,
//                height: 240.0,
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.2),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: ListTile(
                                  title: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Nombre",
                                      icon: Icon(Icons.person_outline),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "El nombre no debe ir vacio";
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _nameTextController,
                                  ),
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
                                child: ListTile(
                                  title: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      icon: Icon(Icons.email),
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailTextController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regExp = RegExp(pattern);
                                        if (!regExp.hasMatch(value)) {
                                          return 'Porfavor asegurate de ingresar un email valido';
                                        } else
                                          return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey.withOpacity(0.2),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: ListTile(
                                  title: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "La contraseña no debe ir vacia";
                                      } else {
                                        if (value.length < 6) {
                                          return "la contraseña debe ser mayor a 6 digitos";
                                        }
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _passwordTextController,
                                    obscureText: hidePass,
                                  ),
                                  trailing: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          hidePass = false;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(0.5),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: ListTile(
                                  title: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "La contraseña no debe ir vacia";
                                      } else {
                                        if (value.length < 6) {
                                          return "la contraseña debe ser mayor a 6 digitos";
                                        } else if (_passwordTextController
                                                .text !=
                                            value) {
                                          return "Las contraseñas no son iguales";
                                        }
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _confirmPasswordTextController,
                                    obscureText: hidePass,
                                  ),
                                  trailing: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          hidePass = false;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                  color: Colors.deepOrange,
                                  elevation: 0.2,
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: MaterialButton(
                                    onPressed: () async {
                                     // validateForm();
                                     if(_formKey.currentState.validate()) {
                                          if(! await user.signUp(_nameTextController.text,_emailTextController.text, _passwordTextController.text)){
                                            _key.currentState.showSnackBar(SnackBar(content: Text("SignUp in failed")));
                                          } else { changeScreenReplacemente(context, HomePage()); }
                                        }
                                    },
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: Text("Sign up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0)),
                                  ))),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "I already have an account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.deepOrange, fontSize: 16),
                                  ))),
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
                                    "Or Sing up with",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(
                                    color: Colors.black,
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
                                             name : user.displayName,
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
                      ))),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ))
        ],
      ),
    );
  }

  

  Future validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      //  formState.reset();
       await FirebaseAuth.instance.signOut();
      FirebaseUser _user = await firebaseAuth.currentUser();
      print("lelgo aquii");
      if (_user == null) {
        print("lelgo aquii2");
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((_user) => {
                  _userServices.createUsers(
                    name: _nameTextController.text,
                    email: _emailTextController.text,
                    userId: _user.user.uid,
                  )
                })
            .catchError((err) => {print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }
}
