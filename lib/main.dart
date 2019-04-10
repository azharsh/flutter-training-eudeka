import 'package:flutter/material.dart';
import 'package:api/Ingredients.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //json
import 'package:api/detail.dart';
import 'package:api/photo.dart';
import 'package:api/favorite.dart';


void main() => runApp(new MyApp());



// App root class
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'The Ingredients',
        home: new IngredientsPage()
    );
  }
}

// Home page class
class IngredientsPage extends StatefulWidget {

  IngredientsPage({Key key}) : super(key: key);

  @override
  _IngredientsPageState createState() => new _IngredientsPageState();
}

// Home page state class
class _IngredientsPageState extends State<IngredientsPage> {

  List<Ingredients> ingredients = [];
  // List<FavModel> favlist = <FavModel>[];
  // final Set<FavModel> _saved = new Set<FavModel>(); 

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("The Ingredients"),
        ),
        body: getBody());
  }

  getBody( ) {
    if (ingredients.length == 0) {
      return new Center(child: new CircularProgressIndicator());
    } else {
      return getListView();
    }
  }

  ListView getListView( ) => new ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i ) {
     final Set<FavModel> _saved = new Set<FavModel>();  
    final bool alreadySaved = _saved.contains(i);


    return new Row(
      
      children: <Widget>[
       PhotoHero(
          photo: "${ingredients[i].strCategoryThumb}",
          width: 100.0,
          heigth: 100.0,
          tag: "${ingredients[i].idCategory}",
    
          onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IngredientsDetailPage(ingredients: ingredients[i])
              )
          );
          },
        ),
         Text("${ingredients[i].strCategory}"),
         GestureDetector(
           child:  new Icon(  Icons.favorite ,
        color:  Colors.red ,
        ),
        onTap:() {
               
               
          
          //  if (alreadySaved) {
          //   _saved.remove(i);
          // } else {
          //   _saved.add(model);
          // }

        },
         )
      ],

    );
  }

  loadData() async {
    String dataURL = "https://www.themealdb.com/api/json/v1/1/categories.php";
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        ingredients =  (responseJson['categories'] as List).map((p) => Ingredients.fromJson(p)).toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }

  }
}