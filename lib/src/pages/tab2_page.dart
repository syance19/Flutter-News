import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/tema.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';



class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService= Provider.of<NewsService>(context);
    return SafeArea(
          child: Scaffold(
        body: Column(
          children: [
           _ListaCategorias(),
           Expanded(
             child: ListaNoticias(newsService.getarticulosCategoria)
             ),
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final categories= Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          final name= categories[index].name;
          return Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(categories[index]),
                  SizedBox(height: 5),
                  Text('${name[0].toUpperCase()}${name.substring(1)}')
                ],
              ),
            ),
          );
        }
        
        ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categories;

  const _CategoryButton( this.categories) ;
  


  @override
  Widget build(BuildContext context) {
    final newsService= Provider.of<NewsService>(context);
    return GestureDetector(
      onTap:(){
        final newsService= Provider.of<NewsService>(context,listen: false);
        newsService.selectedCategory=categories.name;
      },
          child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categories.icon,
          color: (newsService.selectedCategory == this.categories.name) ? miTema.accentColor
                  : Colors.black54,
             
        ),
        
      ),
    );
  }
}