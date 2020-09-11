import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:mobx/mobx.dart';
import 'package:proj_boticario/Model/lastest_news_model.dart';
import 'package:proj_boticario/constants.dart';

part 'list_lastest_controller.g.dart';

class ListLastestController = _ListLastestController
    with _$ListLastestController;

abstract class _ListLastestController with Store {
  Future<List<News>> getList() async {
    var uri = endPoint;
    Http.Response response = await Http.get(
      uri,
    );

    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(utf8.decode(response.bodyBytes));
      LastestNews lastestn = new LastestNews.fromJson(decodeJson);
      return lastestn.news;
    }
    return null;
  }
}
