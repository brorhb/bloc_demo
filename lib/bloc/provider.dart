import 'package:flutter/material.dart';
import 'package:forms_and_validation_bloc/bloc/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}