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
            child: TextButton(
              onPressed: () async {
                // await Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ProfilePage()));
                await GoogleAuthClass().signOutGoogle();

                await Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: const Text('Log Out'),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('User successfully loged in'),
          ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurrentLocationScr()));
              },
              child: const Text('Current Location')),
          ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherDateScreen()));
              },
              child: const Text('REST API for checking weather '))
        ],
      ))),
    );
  }
}
