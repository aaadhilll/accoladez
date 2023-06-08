import 'package:accolades/source/screens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../firebase_services/google_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 95,
                width: 95,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL.toString()),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(
                    width: 1,
                  ),
                  // borderRadius: BorderRadius.circular(35),
                ),
              ),
              Text('${FirebaseAuth.instance.currentUser!.displayName}'),
              ElevatedButton(
                onPressed: () async {
                  await GoogleAuthClass().signOutGoogle();

                  await Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text('Log out'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width / 2,
                        MediaQuery.of(context).size.width / 9),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text('Back'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width / 2,
                        MediaQuery.of(context).size.width / 9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
