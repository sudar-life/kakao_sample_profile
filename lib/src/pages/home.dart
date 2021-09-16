import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_sample_profile/src/controller/profile_controller.dart';
import 'package:kakao_sample_profile/src/pages/login.dart';
import 'package:kakao_sample_profile/src/pages/profile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        ProfileController.to.authStateChanges(snapshot.data);
        if (snapshot.hasData) {
          return Profile();
        } else {
          return LoginWidget();
        }
      },
    );
  }
}
