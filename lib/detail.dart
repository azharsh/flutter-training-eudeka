import 'package:flutter/material.dart';
import 'package:api/Ingredients.dart';
import 'package:api/photo.dart';
import 'package:flutter/scheduler.dart';


class IngredientsDetailPage extends StatelessWidget {
  Ingredients ingredients;
  IngredientsDetailPage({Key key, @required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  timeDilation = 5.0;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Ingredients"),
        ),
        body: getBody(context)
    );
  }

  getBody(BuildContext context ){
    return new ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "${ingredients.strCategory}",
            softWrap: true,
          ),       
        ),

        PhotoHero(
          photo: '${ingredients.strCategoryThumb}',
          width: 100.0,
          tag:'${ingredients.idCategory}' ,
          onTap: () {
          Navigator.of(context).pop();
          },
        ),

        Container(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "${ingredients.strCategoryDescription}",
            softWrap: true,
          ),       
        )
      ],
    );
  }
}