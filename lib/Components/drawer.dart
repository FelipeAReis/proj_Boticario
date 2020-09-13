import 'package:flutter/material.dart';
import '../Data/user.dart';

class NovoDrawer extends StatefulWidget {
  @override
  _NovoDrawerState createState() => _NovoDrawerState();
}

class _NovoDrawerState extends State<NovoDrawer> {


   
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text(USER),
            accountEmail: new Text(EMAIL),
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(IMG),
              ),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                child: Column(
                  children: <Widget>[
                    new Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 22.0,
                    ),
                    new Text(
                      "Editar",
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Column(
                        children: <Widget>[

                          Row(
                            children: <Widget>[
                              Icon(Icons.sim_card_alert),
                              Text("Alerta"),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          )
                        ],
                      ),
                      content: Text(
                          "Olá, eu sou o Administrador, infelizmente você não tem \npermissão para me editar, mais fico feliz que tenha tentado"),
                      actions: <Widget>[
                        FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
                      ],
                      elevation: 24,
                    ),
                  );
                },
              )
            ],
          ),
          ListTile(
            trailing: new Icon(Icons.account_balance),
            title: Text('Menu 1'),
            onTap: () {},
          ),
          Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: Text('Sair'),
            trailing: new Icon(Icons.exit_to_app),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
