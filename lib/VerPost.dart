import 'package:flutter/material.dart';
import 'package:fotofeed/Post.dart';

class VerPost extends StatefulWidget {
  final Post post;

  VerPost({Key key, @required this.post}) : super(key: key);

  _VerPostState createState() => _VerPostState();
}

class _VerPostState extends State<VerPost> {
  List<String> comentarios = ["Comentario de prueba 1", "muy buena foto"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage:
                    AssetImage("assets/users/${widget.post.usuario.foto}"),
              ),
              title: Text(widget.post.usuario.nombre),
              subtitle: Text(
                widget.post.usuario.local,
                style: TextStyle(color: Colors.orange),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.post.descripcion),
            ),
            Hero(
              tag: "${widget.post.foto}",
              child: Image.asset("assets/posts/${widget.post.foto}",
                  fit: BoxFit.contain),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: comentarios.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          "assets/users/2.jpg"),
                    ),
                    title: Text("Autor"),
                    subtitle: Text(comentarios[index]),
                  );
                },
              ),
            ),
            Divider(height: 0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      labelText: "Escribe un mensaje...",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
