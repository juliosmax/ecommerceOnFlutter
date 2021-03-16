import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';  

abstract class BaseAuth{
  Future<FirebaseUser> googleSignIn();
}

class Auth implements BaseAuth{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance; 
  @override
    Future<FirebaseUser> googleSignIn() async{

        final GoogleSignIn _googleSignIn=GoogleSignIn();
        final GoogleSignInAccount googleSignInAccount= await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth= await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        try{
           final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);// aqui creo que ya se logue a la app mediante firebase y las credenciales del usuario de google
          FirebaseUser user = authResult.user;
          return user;
        } catch(e) {

        }
         return null;
    }

}