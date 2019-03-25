import 'dart:async';
import 'package:forms_and_validation_bloc/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

// Too use the Validators mixin, we first need to extend something. Here we extends the Object class as it does not contain anything Flutter does not already provide.
class Bloc extends Object with Validators {
  final BehaviorSubject<String> _email = new BehaviorSubject<String>();
  final BehaviorSubject<String> _password = new BehaviorSubject<String>();

  // Add data to Stream
  Function(String) get emailInput => _email.sink.add;
  Function(String) get passwordInput => _password.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Using RxDart a Stream is now called an Observable and a StreamController a Subject
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  void submit () {
    final validEmail =_email.value;
    final validPassword = _password.value;
    print('{ email: $validEmail }, { password: $validPassword }');
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}