
import 'package:flutter/material.dart';
import 'package:proj_boticario/Components/alertdialogeditpost.dart';
import 'package:proj_boticario/Controller/home_page_post_controller.dart';

class StackMenuTop extends StatelessWidget {
  const StackMenuTop({
    Key key,
    @required this.size,
    this.list
  }) : super(key: key);

  final Size size;
  final HomePagePostController list;
  


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          width: size.width,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              width: size.width * 0.45,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/people.png"),
                      fit: BoxFit.contain)),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      color: Colors.transparent,
                      textColor: Colors.white,
                      child: Text("Últimas Novidades"),
                      onPressed: () => Navigator.of(context)
                          .pushNamed('/listLastestPage')),
                ),
                SizedBox(
                  width: 150,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      color: Colors.transparent,
                      textColor: Colors.white,
                      child: Text("Novo Post"),
                      onPressed: () {
                        showDialog(
                          
                          context: context,
                          builder: (context) => AlertDialogEditPost(list: list, tipo: false,),
                        );
                      }),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
