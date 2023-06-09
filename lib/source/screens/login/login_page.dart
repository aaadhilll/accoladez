import 'package:accolades/source/screens/home/home.dart';
import 'package:accolades/source/screens/login/sign_up.dart';
// import 'package:accolades/source/screens/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../firebase_services/google_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userEmail = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _userEmail.dispose();
    _password.dispose();
    super.dispose();
  }

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (!_emailRegex.hasMatch(value!)) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      controller: _userEmail,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        label: const Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: Text(
                            'Email',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ), //<-- SEE HERE
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.length < 6) {
                          return 'Password must be minimum 6 charecters';
                        }
                        return null;
                      },
                      controller: _password,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        label: const Padding(
                          padding: EdgeInsets.only(left: 11),
                          child: Text(
                            'Password',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ), //<-- SEE HERE
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButtons(
                        test: 'Log in',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _userEmail.text.trim(),
                                    password: _password.text.trim());

                            // print('#########');
                            // print(FirebaseAuth.instance.authStateChanges());
                            StreamBuilder<User?>(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return const HomePage();
                                } else {
                                  Fluttertoast.showToast(msg: 'Please enter');
                                  return LoginPage();
                                }
                              },
                              // child: LoginPage()
                            );
                          } else {
                            print('Error');
                          }
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 5),
                    child: Row(
                      children: [
                        Text("User don't have account?"),
                        TextButton(
                            onPressed: () async {
                              // FirebaseAuth.instance
                              //     .createUserWithEmailAndPassword(
                              //         email: _userEmail.text.trim(),
                              //         password: _password.text.trim());
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButtons(
                  //       test: 'Login using Google',
                  //       onTap: () async {
                  //         await GoogleAuthClass().singnInGoogle();
                  //         await Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => HomePage()));
                  //       }),
                  // ),
                  GestureDetector(
                    onTap: () async {
                      // await GoogleAuthClass().singnInGoogle();
                      // await Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                      await Fluttertoast.showToast(
                          msg: 'Loading...', timeInSecForIosWeb: 10);
                      await GoogleAuthClass().singnInGoogle().then((value) =>
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return HomePage();
                          })));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: const Color(0xff7c94b6),
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: MediaQuery.of(context).size.height / 13,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 7),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: Image.network(
                                      "https://image.similarpng.com/very-thumbnail/2020/12/Colorful-google-logo-design-on-transparent-PNG-1.png"),
                                ),
                              ),
                              const Text(
                                '   Sign in with google',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

class ElevatedButtons extends StatelessWidget {
  ElevatedButtons({
    super.key,
    required this.onTap,
    required this.test,
  });

  final String test;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        test,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.of(context).size.width / 0.8,
              MediaQuery.of(context).size.width / 9),
        ),
      ),
    );
  }
}
