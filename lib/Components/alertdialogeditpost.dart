import 'package:flutter/material.dart';
import 'package:proj_boticario/Controller/home_page_post_controller.dart';

class AlertDialogEditPost extends StatelessWidget {
  const AlertDialogEditPost({
    Key key,
    this.index,
    @required this.tipo, // se false é novo posto, se true é edit
    @required this.list,
  }) : super(key: key);

  final bool tipo;
  final int index;
  final HomePagePostController list;

  @override
  Widget build(BuildContext context) {
     TextEditingController myTextController = new TextEditingController();

   (tipo == true) ? myTextController.text = list.list[index]["message"]["content"] : myTextController.text;

    return AlertDialog(
      title: Row(
        children: <Widget>[
          Icon(
            Icons.textsms,
            color: Colors.deepPurple,
          ),
          Text(
            "Cadastrar Nova Postagem",
            style: TextStyle(color: Colors.deepPurple),
          ),
        ],
      ),
      content: Container(
        child: TextFormField(
          controller: myTextController,
          maxLength: 280,
          maxLines: 10,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mensagem',
    
          ),
          
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancelar")),
        (tipo == false)
            ? FlatButton(
                focusColor: Colors.deepPurple,
                autofocus: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.deepPurple)),
                onPressed: () {
                  list.addPost(myTextController.text);
                  Navigator.of(context).pop();
                },
                child: Text("Postar"))
            : FlatButton(
                focusColor: Colors.deepPurple,
                autofocus: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.deepPurple)),
                onPressed: () {
                  list.editPost(index, myTextController.text);
                  Navigator.of(context).pop();
                },
                child: Text("Salvar Edição"))
      ],
      elevation: 24,
    );
  }
}
