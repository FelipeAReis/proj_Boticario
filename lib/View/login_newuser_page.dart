import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj_boticario/FadeAnimation.dart';
import 'package:proj_boticario/Validators/bloc.dart';

class LoginNewUserPage extends StatelessWidget {
  final bloc = new Bloc();

  meuAlerta(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Cadastro",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: StreamBuilder(
                                    stream: bloc.name,
                                    builder: (context, snapshot) => TextField(
                                      onChanged: (s) => bloc.nameChanged.add(s),
                                      decoration: InputDecoration(
                                          errorText: snapshot.error,
                                          border: InputBorder.none,
                                          hintText: "Nome",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: StreamBuilder(
                                    stream: bloc.email,
                                    builder: (context, snapshot) => TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (s) =>
                                          bloc.emailChanged.add(s),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          errorText: snapshot.error,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder(
                                    stream: bloc.password,
                                    builder: (context, snapshot) => TextField(
                                      obscureText: true,
                                      onChanged: (s) =>
                                          bloc.passwordChanged.add(s),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          errorText: snapshot.error,
                                          hintText: "Senha",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, .6),
                                  Color.fromRGBO(143, 148, 251, 1),
                                ])),
                            child: Center(
                              child: StreamBuilder(
                                stream: bloc.submitCheckAdd,
                                builder: (context, snapshot) => SizedBox(
                                  width: double.infinity,
                                  child: FlatButton(
                                    onPressed: snapshot.hasData
                                        ? () => meuAlerta(context)
                                        : null,
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
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(255, 0, 0, 1),
                                  Color.fromRGBO(128, 0, 0, .6),
                                ])),
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: FlatButton(
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
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
