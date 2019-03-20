import 'package:flutter/material.dart';
import 'package:fotofeed/Post.dart';
import 'package:fotofeed/VerPost.dart';

class PostView extends StatefulWidget {
  final Post post;

  PostView({Key key, @required this.post}) : super(key: key);

  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          Container(
              margin: EdgeInsets.all(4),
              child: Hero(
                tag: "${widget.post.foto}",
                child: Image.asset("assets/posts/${widget.post.foto}",
                    fit: BoxFit.contain),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.post.likeUp();
                      });
                    },
                  ),
                  Text("${widget.post.likes} likes")
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.comment,
                      color: Colors.blue,
                    ),
                    onPressed: () {
              Route route =MaterialPageRoute(builder: (bc) => VerPost(post: widget.post,));
              Navigator.of(context).push(route);
              },
                  ),
                  Text("Comentarios"),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
