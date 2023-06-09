import 'package:accolades/source/screens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userEmail = TextEditingController();

  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _userEmail.dispose();
    _password.dispose();
    super.dispose();
  }

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
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
                        test: 'Sign up',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // FirebaseAuth.instance.signInWithEmailAndPassword(
                            //     email: _userEmail.text.trim(),
                            //     password: _password.text.trim());
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _userEmail.text.trim(),
                                    password: _password.text.trim());
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            print('Error');
                          }
                        }),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
