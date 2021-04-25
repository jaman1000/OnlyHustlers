import 'package:flutter/material.dart';
import 'package:only_hustlers_app/models/user.dart';
import 'package:only_hustlers_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:only_hustlers_app/wrapper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: AuthSercive().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
