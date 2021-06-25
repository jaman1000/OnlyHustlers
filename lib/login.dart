import 'package:flutter/material.dart';
import 'package:only_hustlers_app/popUp.dart';
import 'package:only_hustlers_app/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // final AuthSercive _auth = AuthSercive();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 60.0, 0, 0),
                child: Text('Only',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 135.0, 0, 0),
                child: Text('Hustlers',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
              )
            ])),
            Form(
                key: _formKey,
                child: Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (val) => val.length < 6
                              ? 'Enter a password that is at least 6 characters'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                            height: 40.0,
                            child: GestureDetector(
                              /*  onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result = await _auth
                                      .signinWithEmailPassword(email, password);
                                  if (result == null) {
                                    setState(() =>
                                        error = 'Credentials are invalid');
                                  }
                                }
                              },*/
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Container(
                            height: 40.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.blueAccent,
                                color: Colors.blue,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 30.0),
                        Container(
                            child: Text('Only Hustlers Hustle Only',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Montserrat')))
                      ],
                    )))
          ],
        ));
  }
}
