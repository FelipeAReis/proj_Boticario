import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj_boticario/Validators/bloc.dart';
import '../icons_social_icons.dart' as CustomIcon;

class LoginPage extends StatelessWidget {
  final bloc = new Bloc();

  changeThePage(BuildContext context){
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('/homePage');
  }
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown]);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 160,
                  height: 100,
                  child: Image.asset(
                    'assets/images/logo_color.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        StreamBuilder<String>(
                          stream: bloc.email,
                          builder: (context, snapshot) => TextFormField(
                            onChanged: (s) => bloc.emailChanged.add(s),
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                border: OutlineInputBorder(),
                                labelText: 'E-mail'),
                                keyboardType: TextInputType.emailAddress ,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                        
                        
                        
                        StreamBuilder<String>(
                          stream: bloc.password,
                          builder: (context, snapshot) => TextFormField(
                            onChanged:(s) => bloc.passwordChanged.add(s),
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Senha',
                              errorText: snapshot.error
                            ),

                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                        StreamBuilder<bool>(
                            stream: bloc.submitCheck,
                            builder: (context, snapshot) => SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: snapshot.hasData ? () => changeThePage(context) : null,
                              textColor: Colors.white,
                              child: Text(
                                'Entrar',
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
                            color: Colors.green,
                            onPressed: () {

                              

                              return Navigator.of(context)
                                  .pushNamed('/loginNewUserPage');
                            },
                            textColor: Colors.white,
                            child: Text(
                              'Cadastrar Novo Usuário',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: <Widget>[
                          Expanded(child: Divider(color: Colors.grey)),
                          Text(
                            "   OU   ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(child: Divider(color: Colors.grey)),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.blue[900],
                            onPressed: () {
                              print('Login Facebook');
                            },
                            textColor: Colors.white,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(CustomIcon.IconsSocial.facebook_squared),
                                  Text(
                                    'Login com Facebook',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.blue[200],
                            onPressed: () {
                              print('login com Twitter');
                            },
                            textColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(CustomIcon.IconsSocial.twitter),
                                Text(
                                  'Login com Twitter',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              print('login com Google');
                            },
                            textColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(CustomIcon.IconsSocial.google),
                                Text(
                                  'Login com Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
