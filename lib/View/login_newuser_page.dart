import 'package:flutter/material.dart';

class LoginNewUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Cadastrar Novo Usuário"),
        ),
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nome'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira o Nome';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'E-mail'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira o E-mail';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    autovalidate: true,

                    validator: (value) {
                    
                      if (value.isEmpty) {
                        return 'Insira sua Senha';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        print("Cadastrado");
                      },
                      textColor: Colors.white,
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        return Navigator.of(context).pop();
                      },
                      textColor: Colors.white,
                      child: Text(
                        'Voltar',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
