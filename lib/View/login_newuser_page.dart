import 'package:flutter/material.dart';
import 'package:proj_boticario/Validators/bloc.dart';

class LoginNewUserPage extends StatelessWidget {
  final bloc = new Bloc();
  meuAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.accessibility_new),
                Text("Alerta"),
              ],
            ),
            Divider(
              color: Colors.black,
            )
          ],
        ),
        content: Text("Usuário cadastrado com sucesso"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
        ],
        elevation: 24,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Cadastrar Novo Usuário"),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder(
                    stream: bloc.name,
                    builder: (context, snapshot) => TextFormField(
                      onChanged: (s) => bloc.nameChanged.add(s),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: snapshot.error,
                          labelText: 'Nome'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  StreamBuilder(
                    stream: bloc.email,
                    builder: (context, snapshot) => TextFormField(
                      onChanged: (s) => bloc.emailChanged.add(s),
                      decoration: InputDecoration(
                          errorText: snapshot.error,
                          border: OutlineInputBorder(),
                          labelText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  StreamBuilder(
                    stream: bloc.password,
                    builder: (context, snapshot) => TextFormField(
                      onChanged: (value) => bloc.passwordChanged.add(value),
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  StreamBuilder(
                    stream: bloc.submitCheckAdd,
                    builder: (context, snapshot) => SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed:
                            snapshot.hasData ? () => meuAlerta(context) : null,
                        textColor: Colors.white,
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
