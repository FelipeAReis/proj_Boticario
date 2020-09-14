import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:proj_boticario/Components/drawer.dart';
import 'package:proj_boticario/Components/stackmenutop.dart';
import 'package:proj_boticario/Components/timeline.dart';
import 'package:proj_boticario/Controller/home_page_post_controller.dart';

class HomePagePost extends StatefulWidget {
  @override
  _HomePagePostState createState() => _HomePagePostState();
}

class _HomePagePostState extends State<HomePagePost> {
  HomePagePostController lista = new HomePagePostController();

  @override
  void initState() {
    super.initState();
    lista.loadJson();
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown]);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Pagina Inicial"),
      ),
      drawer: NovoDrawer(),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: Column(
             children: <Widget>[
              StackMenuTop(size: size,list: lista),
              Container(
                  width: double.infinity,
                  height: size.height - 195,
                  color: Colors.transparent,
                  child: Observer(builder: (_) {
                    return ListView.builder(
                      itemCount: lista.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> posts =
                            lista.list[(lista.list.length - 1) - index];

                        return TimeLine(
                          name: posts["user"]["name"],
                          content: posts["message"]["content"],
                          profilePicture: posts["user"]["profile_picture"],
                          createdAt: posts["message"]["created_at"],
                          userId: posts["user"]["id"],
                          postId: posts["user"]["post_id"],
                          post: lista,
                          index: (lista.list.length - 1) - index,
                          gestureDetector: true,
                        );
                      },
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
