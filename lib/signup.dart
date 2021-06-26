import 'package:flutter/material.dart';
import 'package:only_hustlers_app/services/auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPage createState() => new _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthSercive _auth = AuthSercive();

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: <Widget>[
            Container(
                child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0, 0),
                child: Text('Are You Ready',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 175.0, 0, 0),
                child: Text('To Hustle?',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
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
                            hintText: 'First Name',
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your first name' : null,
                          onChanged: (val) {
                            setState(() => firstName = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter you last name',
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your last name' : null,
                          onChanged: (val) {
                            setState(() => lastName = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your email' : null,
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
                            }),
                        SizedBox(height: 40.0),
                        Container(
                            height: 40.0,
                            child: GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.signin(email, password);
                                  if (result == null) {
                                    setState(() =>
                                        error = 'Please provide valid email');
                                  }
                                }
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'COMPLETE',
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
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.blueAccent,
                                color: Colors.blue,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'BACK',
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
