import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
//import 'package:google_sign_in/google_sign_in.dart';
class auth_service {
  //handle authstate()
  //signinwithgoogle()
  //signout()
  handleauthstate() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          }
          else {
            return const LoginPage();
          }
        }

    );
  }

    signInWithGoogle() async {
    //Triggering the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!
        .authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accesstoken,
      idToken: googleAuth.idToken,

    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  }
  signOut(){
 FirebaseAuth.instance.signOut();

}
