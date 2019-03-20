import 'package:fotofeed/Usuario.dart';

class Post {
  final String foto;
  final Usuario usuario;
  final String descripcion;
  int likes = 0;

  Post(this.foto, this.usuario, this.descripcion);
  
  void likeUp(){
    this.likes++;
  }
}