import 'dart:async';
import 'package:forms_and_validation_bloc/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

// Too use the Validators mixin, we first need to extend something. Here we extends the Object class as it does not contain anything Flutter does not already provide.
class Bloc extends Object with Validators {
  final StreamController<String> _email = new StreamController<String>.broadcast();
  final StreamController<String> _password = new StreamController<String>.broadcast();

  // Add data to Stream
  Function(String) get emailInput => _email.sink.add;
  Function(String) get passwordInput => _password.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Using RxDart a Stream is now called an Observable and a StreamController a Subject
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  void dispose() {
    _email.close();
    _password.close();
  }
}