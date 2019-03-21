import 'dart:async';

class Validators {
  final StreamTransformer<String, String> validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, sink) {
      if (email.contains('@')) sink.add(email);
      else sink.addError('Enter a valid email');
    }
  );

  final StreamTransformer<String, String> validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, sink) {
      if (password.length > 3) sink.add(password);
      else sink.addError('Password must be longer');
    }
  );
}