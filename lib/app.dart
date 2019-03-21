import 'package:flutter/material.dart';
import 'package:forms_and_validation_bloc/screens/login_screen.dart';
import 'package:forms_and_validation_bloc/bloc/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.amber
        ),
        title: 'Log me in',
        home: LoginScreen()
      ),
    );
  }
}