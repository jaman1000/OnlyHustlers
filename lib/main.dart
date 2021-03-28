import 'package:flutter/material.dart';
import 'package:only_hustlers_app/signup.dart';
import 'signup.dart';
import 'goals.dart';
import 'dashboard.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:<String, WidgetBuilder>{
        '/signup':(BuildContext context) => new SignupPage (),
        '/goals':(BuildContext context) => new Goals ()
      },
      home: new Dashboard(),
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPage createState() => new _LoginPage();
}

  class _LoginPage extends State<LoginPage> {
    @override
    Widget build(BuildContext context){
      return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:<Widget> [
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0, 0),
                    child: Text(
                      'Only',
                      style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold)
                    ),
                    ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0, 0),
                    child: Text(
                      'Hustlers',
                      style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold)
                    ),
                    )
                  ]
              )
              ),
                  Container(
                    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'USERNAME',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                            )
                          )
                        ),
                        SizedBox(height: 20.0),
                         TextField(
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                            )
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top:15.0, left: 20.0),
                          child: InkWell(
                            child: Text('Forgot Password',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline
                              ),
                            ),
                            ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              height:40.0, 
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                            SizedBox(height:20.0),
                           Container(
                              height:40.0, 
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.blueAccent,
                                color: Colors.blue,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/signup');
                                  },
                                  child: Center(
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                            SizedBox(height:30.0),
                            Container(
                              child:Text('Only Hustlers Hustle Only',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat' 
                              ))
                            )

                      ], 
                    )
                  )
        ],
        )
      );
    }
  }