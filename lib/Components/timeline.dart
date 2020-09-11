import 'package:flutter/material.dart';
import 'package:proj_boticario/Model/lastest_news_model.dart';
import 'package:intl/intl.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({
    Key key,
    @required this.user,
  }) : super(key: key);

  final News user;

  @override
  Widget build(BuildContext context) {

    TextEditingController _textController = new TextEditingController();
    _textController.text = user.message.content;

    return new Stack(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: new Card(
            margin: new EdgeInsets.all(20.0),
            child: new Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.grey[200],
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: user.user.profilePicture.isNotEmpty
                              ? NetworkImage(
                                  "https://image.freepik.com/vetores-gratis/perfil-de-avatar-de-homem-no-icone-redondo_24640-14044.jpg")
                              : NetworkImage(user.user.profilePicture),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.user.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          
                          counter: Offstage(),
                          counterStyle: TextStyle(height: double.minPositive)
                          ),
                    maxLines: 5,
                    maxLength: 280,
                    readOnly: true,

                    controller: _textController,
                  ),
                    ),
                  ),
                  
                  Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                       DateFormat("dd/MM/yyyy H:m").format(DateTime.parse(user.message.createdAt)),
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        new Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 35.0,
          child: new Container(
            height: double.infinity,
            width: 1.0,
            color: Colors.blue,
          ),
        ),
        new Positioned(
          top: 100.0,
          left: 15.0,
          child: new Container(
            height: 40.0,
            width: 40.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: new Container(
              margin: new EdgeInsets.all(5.0),
              height: 30.0,
              width: 30.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[200]),
              child: Icon(Icons.access_time),
            ),
          ),
        )
      ],
    );
  }
}
