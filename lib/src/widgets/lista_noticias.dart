

import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/pages/info_page.dart';
import 'package:newsapp/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias( this.noticias);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index){
        return _Noticia(noticias: this.noticias[index],index:index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticias;
  final int index;

  const _Noticia({ 
    @required  this.noticias, 
    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       _TarjetaTopBar(noticias,index),
       _TarjetaTitulo(noticias),
       _TarjetaImagen(noticias),
       _TarjetaBody(noticias),
       _TarjetaBotones(noticias),
       SizedBox(height: 10,),
       Divider(),
     ],
      );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  
 final Article noticias;
 final int index;
  const _TarjetaTopBar( this.noticias,this.index) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index+1}. ', style: TextStyle(color: miTema.accentColor),),
          Text('${noticias.source.name}. ', style: TextStyle(color: miTema.accentColor),)
        ],
      ),
    );
  }
}


 class _TarjetaTitulo extends StatelessWidget {
   final Article noticia;

  const _TarjetaTitulo( this.noticia);

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(noticia.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
      );
    }
  }

  class _TarjetaImagen extends StatelessWidget {
    final Article noticia;

  const _TarjetaImagen( this.noticia) ;

    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          child: Container(
            child: (noticia.urlToImage !=null) ?
            FadeInImage(
              placeholder: AssetImage('assets/img/giphy.gif'), 
              image: NetworkImage(noticia.urlToImage)
              ): Image(image: AssetImage('assets/img/no-image.png'),)
          ),
        ),
      );
    }
  }

  class _TarjetaBody extends StatelessWidget {
    final Article noticia;

  const _TarjetaBody(this.noticia) ;
    @override
    Widget build(BuildContext context) {
      return Container( 
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text((noticia.description !=null) ? noticia.description:''),
      );
    }
  }

  class  _TarjetaBotones extends StatelessWidget {
    final Article noticias;

  const _TarjetaBotones( this.noticias);

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              onPressed: (){},
              fillColor: miTema.accentColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.star_border),
            ),
            SizedBox(width: 10,),
            RawMaterialButton(
              onPressed:() => Navigator.push(context,MaterialPageRoute(
                builder: (context)=> InfoPage(noticias),
              
                )
                ),
              fillColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.more),
            )
          ],
        ),
      );
    }
  }