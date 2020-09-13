import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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


  @override
  Widget build(BuildContext context) {

    
    Size size = MediaQuery.of(context).size;
  
    HomePagePostController list = new HomePagePostController();

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StackMenuTop(size: size),
              Container(
                width: double.infinity,
                height: size.height - 200,
                color: Colors.transparent,
                child: FutureBuilder(
                  future: list.loadJson(),
                  initialData: null,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData)
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );

                    var itens = snapshot.data;

                    return (itens != null)
                        ? new ListView.builder(
                            itemCount: itens.length,
                            itemBuilder: (BuildContext context, int index) {
                              
                              
                              Map<String, dynamic> posts = itens[index];

                              return  TimeLine(
                                  name: posts["user"]["name"],
                                  content: posts["message"]["content"],
                                  profilePicture: posts["user"]["profile_picture"],
                                  createdAt: posts["message"]["created_at"],
                                  userId: posts["user"]["id"],
                                  postId: posts["user"]["post_id"],
                                  gestureDetector: true,
                                );
                            
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
