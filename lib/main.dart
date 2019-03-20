import 'package:flutter/material.dart';
import 'package:fotofeed/PostView.dart';
import 'Post.dart';
import 'Usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App de Fotos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Usuario> usuarios = [];
  List<Post> posts = [];

  void initState() {
    usuarios.add(Usuario("1.jpg", "Karla", "Tamaulipas, México"));
    usuarios.add(Usuario("2.jpg", "Jovana", "Nuevo León, México"));
    usuarios.add(Usuario("3.jpg", "Cristina", "Veracruz, México"));

    posts.add(Post("1.jpg", usuarios[0],
        "Una foto de alguna cosa blah blah blah blah blah blah blah blah blah"));
    posts.add(Post("2.jpg", usuarios[1],
        "Una foto de alguna cosa blah blah blah blah blah blah blah blah blah"));
    posts.add(Post("3.jpg", usuarios[2],
        "Una foto de alguna cosa blah blah blah blah blah blah blah blah blah"));
    posts.add(Post("4.jpg", usuarios[1],
        "Una foto de alguna cosa blah blah blah blah blah blah blah blah blah"));
    posts.add(Post("5.jpg", usuarios[0],
        "Una foto de alguna cosa blah blah blah blah blah blah blah blah blah"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.camera_enhance),
        title: Text('Mi App de Fotos'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_,i) => PostView(post: posts[i],),
      ),
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: (){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (bc) => AlertDialog(
              title: Text("Función no disponible"),
              content: Text("Esta función no  está disponible en este momento."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cerrar"),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          );
        },
      ),
    );
  }
}