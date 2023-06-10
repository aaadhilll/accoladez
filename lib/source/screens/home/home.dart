import 'package:flutter/material.dart';

import '../../../firebase_services/google_auth.dart';
import '../google_map/map_scr.dart';
import '../login/login_page.dart';
// import '../profile/profile.dart';
import '../weather/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Accolades'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
              ),
              onPressed: () async {
                // await Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ProfilePage()));
                await GoogleAuthClass().signOutGoogle();

                await Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('User successfully logged In'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButtons(
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurrentLocationScr()));
              },
              test: 'Google Map',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButtons(
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherDateScreen()));
              },
              test: 'REST API for checking weather ',
            ),
          ),
        ],
      ))),
    );
  }
}
