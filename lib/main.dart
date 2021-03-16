import 'package:demoecommerce/commons/loading.dart';
import 'package:demoecommerce/home.dart';
import 'package:demoecommerce/pages/signup.dart';
import 'package:flutter/material.dart';
import './pages/login.dart';
import './provider/user_provider.dart';
import 'package:provider/provider.dart';
import './pages/Splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {

  runApp(MultiProvider(providers: [
                         ChangeNotifierProvider(create: (_) => UserProvider.instance()),
                         
  ],
    
      child:     MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red.shade900
      ),
        home: ScreenController(),
        
      // home: HomePage(),
    )
    )
    
  );

}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserProvider>(context);
      //user.signOut();
      print("eel estatus es ${user.status}");
    switch(user.status) 
    { 
      case Status.Unauthenticated: return Login();
      case Status.Uninitialiazed :  return Splash();
      case Status.Authenticating:return Login();
      case Status.Authenticated: return HomePage();
     default: return Login();
    }
    
  }
}

//hay clavos con el cloudfirestore  , hay q seguir estas guias:
//https://github.com/FirebaseExtended/flutterfire/issues/2455
//https://github.com/FirebaseExtended/flutterfire/blob/master/packages/cloud_firestore/cloud_firestore_web/README.md
//ah y migre al channel beta para web , 


//mas recursos para ver en : https://stackoverflow.com/questions/59716944/flutter-web-upload-image-file-to-firebase-storage