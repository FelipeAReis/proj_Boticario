import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';

import 'package:proj_boticario/Data/user.dart';
part 'home_page_post_controller.g.dart';

class HomePagePostController = _HomePagePostControllerBase
    with _$HomePagePostController;

abstract class _HomePagePostControllerBase with Store {
  @observable
  List list = [];

/* 
  Future<List<Posts>> getListPosts() async {
    var uri = endPointPosts;
    Http.Response response = await Http.get(
      uri,
    );

    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(utf8.decode(response.bodyBytes));
      PostsClass resposta = new PostsClass.fromJson(decodeJson);
      return resposta.posts;
    }
    else 
    {
      print('A Requisição falhou status: ${response.statusCode}');
      return null;
    }
  } */

  @action
  loadJson() async {
    if (list.isEmpty) {
      var jsonString = await rootBundle.loadString('assets/data/data.json');
      list = json.decode(jsonString);
      
    }
  }

  @action
  removePost(int id) async {
    List novaLista = list;
    novaLista.removeWhere((element) => element["user"]["post_id"] == id);
    list = novaLista;
  }

  @action
 addPost(String text) async {
    Map<String, dynamic> novoPost = {};

    int id = list[list.length - 1]["user"]["post_id"] + 1;

    novoPost = {
      "user": {"id": ID, "post_id": id, "name": USER, "profile_picture": IMG},
      "message": {"content": text, "created_at": DateTime.now().toString()}
    };

    list.add(novoPost);
    list = list;

    return "ok";
  }

  @action
  editPost(int idPost, String text) {
    Map<String, dynamic> editPost = {};

    editPost = {
      "user": {
        "id": list[idPost]["user"]["id"],
        "post_id": list[idPost]["user"]["post_id"],
        "name": list[idPost]["user"]["name"],
        "profile_picture": list[idPost]["user"]["profile_picture"]
      },
      "message": {
        "content": text,
        "created_at": list[idPost]["message"]["created_at"]
      }
    };
    list[idPost] = editPost;
    list = list;
  }



}
