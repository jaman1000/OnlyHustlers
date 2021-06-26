import 'package:flutter/material.dart';
import 'package:only_hustlers_app/models/user.dart';
import 'package:only_hustlers_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:only_hustlers_app/signup.dart';
import 'package:only_hustlers_app/wrapper.dart';
import 'package:only_hustlers_app/login.dart';
import 'package:only_hustlers_app/goals.dart';
import 'package:only_hustlers_app/dashboard.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthSercive().user,
        initialData: null,
        child: MaterialApp(
          routes: <String, WidgetBuilder>{
            '/signup': (BuildContext context) => new SignupPage(),
            '/login': (BuildContext context) => LoginPage(),
            '/goals': (BuildContext context) => Goals(),
          },
          //home: Wrapper(),
          home: Dashboard(),
        ));
  }
}
