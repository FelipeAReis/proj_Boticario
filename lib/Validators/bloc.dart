import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validator.dart';

class Bloc extends Object with Validators implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  StreamSink<String> get emailChanged => _emailController.sink;
  StreamSink<String> get passwordChanged => _passwordController.sink;
  StreamSink<String> get nameChanged => _nameController.sink;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);
  Stream<String> get name =>
      _nameController.stream.transform(nameValidator);



  Stream<bool> get submitCheck =>
      Rx.combineLatest2(email, password, (e, p) => true);
  Stream<bool> get submitCheckAdd =>
      Rx.combineLatest3(name, email, password, (n, e, p) => true);
    

  

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nameController?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
