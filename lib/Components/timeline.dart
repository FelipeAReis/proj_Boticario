import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:intl/intl.dart';
import 'package:proj_boticario/Components/alertdialogeditpost.dart';
import 'package:proj_boticario/Controller/home_page_post_controller.dart';
import 'package:proj_boticario/Data/user.dart';

class TimeLine extends StatelessWidget {
  const TimeLine(
      {Key key,
      @required this.name,
      @required this.content,
      @required this.profilePicture,
      @required this.createdAt,
      this.index,
      this.post,
      this.userId,
      this.postId,
      this.gestureDetector})
      : super(key: key);

  //final News user;
  final String name;
  final String content;
  final String profilePicture;
  final String createdAt;
  final bool gestureDetector;
  final int userId;
  final int postId;
  final HomePagePostController post;
  final int index;

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = new TextEditingController();
    _textController.text = content;

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
                          backgroundImage: AdvancedNetworkImage(
                            profilePicture,
                            timeoutDuration: Duration(seconds: 3),
                            fallbackAssetImage: "assets/images/logo_color.png",
                            retryLimit: 0,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        (gestureDetector && ID == userId)
                            ? GestureDetector(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialogEditPost(
                                            index: index,
                                            list: post,
                                            tipo: true,
                                          ));
                                  print("Editando");
                                },
                              )
                            : Icon(null),
                        SizedBox(
                          width: 5,
                        ),
                        (gestureDetector && ID == userId)
                            ? GestureDetector(
                                child: SizedBox(
                                    child: Icon(
                                  Icons.delete_forever,
                                  color: Colors.redAccent,
                                )),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Excluir"),
                                            content: Text(
                                                "Você realmente deseja Excluir?"),
                                            actions: <Widget>[
                                              FlatButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: Text("NÃO")),
                                              FlatButton(
                                                onPressed: () {
                                                  post.removePost(postId);
                                                  return Navigator.of(context)
                                                      .pop();
                                                },
                                                child: Text("SIM"),
                                              )
                                            ],
                                          ));
                                },
                              )
                            : Icon(null),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        decoration: InputDecoration(
                            counter: Offstage(),
                            counterStyle:
                                TextStyle(height: double.minPositive)),
                        maxLines: 10,
                        maxLength: 280,
                        maxLengthEnforced: true,
                        readOnly: true,
                        style: TextStyle(fontSize: 13),
                        controller: _textController,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        DateFormat("dd/MM/yyyy H:m")
                            .format(DateTime.parse(createdAt)),
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
            color: Colors.indigo,
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
              child: Icon(Icons.access_time, color: Colors.indigo),
            ),
          ),
        )
      ],
    );
  }
}
