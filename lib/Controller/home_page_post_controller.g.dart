// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_post_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePagePostController on _HomePagePostControllerBase, Store {
  final _$listAtom = Atom(name: '_HomePagePostControllerBase.list');

  @override
  List<dynamic> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<dynamic> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$loadJsonAsyncAction =
      AsyncAction('_HomePagePostControllerBase.loadJson');

  @override
  Future loadJson() {
    return _$loadJsonAsyncAction.run(() => super.loadJson());
  }

  final _$removePostAsyncAction =
      AsyncAction('_HomePagePostControllerBase.removePost');

  @override
  Future removePost(int id) {
    return _$removePostAsyncAction.run(() => super.removePost(id));
  }

  final _$addPostAsyncAction =
      AsyncAction('_HomePagePostControllerBase.addPost');

  @override
  Future addPost(String text) {
    return _$addPostAsyncAction.run(() => super.addPost(text));
  }

  final _$_HomePagePostControllerBaseActionController =
      ActionController(name: '_HomePagePostControllerBase');

  @override
  dynamic editPost(int idPost, String text) {
    final _$actionInfo = _$_HomePagePostControllerBaseActionController
        .startAction(name: '_HomePagePostControllerBase.editPost');
    try {
      return super.editPost(idPost, text);
    } finally {
      _$_HomePagePostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
