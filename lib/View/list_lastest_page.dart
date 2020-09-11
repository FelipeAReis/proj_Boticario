import 'package:flutter/material.dart';
import 'package:proj_boticario/Components/timeline.dart';
import 'package:proj_boticario/Controller/list_lastest_controller.dart';
import 'package:proj_boticario/Model/lastest_news_model.dart';


class ListLastestPage extends StatefulWidget {
  ListLastestPage({Key key}) : super(key: key);

  @override
  _ListLastestPageState createState() => _ListLastestPageState();
}

class _ListLastestPageState extends State<ListLastestPage> {
  ListLastestController list = new ListLastestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Últimas Novidades"),
        ),
        body: new SafeArea(
          child: FutureBuilder(
            future: list.getList(),
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
                        News user = itens[index];
                        return TimeLine(user: user);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ));
  }
}

