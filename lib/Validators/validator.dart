import 'dart:async';

mixin Validators {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Email não é válido");
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("Sua Senha não pode ser menor que 4 caracteres");
    }
  });

    var nameValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (name, sink) {
    if (name.length >= 3) {
      sink.add(name);
    } else {
      sink.addError("Seu Nome não pode ser menor que 3 letras");
    }
  });





}
