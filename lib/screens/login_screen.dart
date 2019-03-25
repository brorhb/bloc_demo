import 'package:flutter/material.dart';
import 'package:forms_and_validation_bloc/bloc/bloc.dart';
import 'package:forms_and_validation_bloc/bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login screen')
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(padding: EdgeInsets.only(top: 20.0)),
            loginButton(bloc)
          ],
        ),
      )
    );
  }

  Widget emailField (Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          onChanged: bloc.emailInput,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email adress',
            hintText: 'you@example.com',
            errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget passwordField (Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          onChanged: bloc.passwordInput,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget loginButton (Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Text('Login'),
          onPressed: !snapshot.hasData ? null : () {
            bloc.submit();
          },
          color: Colors.redAccent,
        );
      }
    );
  }
}