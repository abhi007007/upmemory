import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upmemory/screens/Loadingpage.dart';
import 'package:upmemory/screens/loginPage.dart';
import 'package:upmemory/screens/homePage.dart';

class CheckAuthentication extends StatelessWidget {
  const CheckAuthentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else if (snapshot.hasData == false) {
          return LoginPage();
        } else {
          return LoadingPage();
        }
      },
    );
  }
}
