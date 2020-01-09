import 'package:flutter/material.dart';


class Page2 extends StatelessWidget {
final film;
Page2(this.film);




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Informations'),
    ),

      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

          children: <Widget>[

          Text('Description : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          Text(film["overview"].toString(), style: TextStyle(fontSize: 15)) ,
          Text('Date de sortie : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          Text(film["release_date"].toString(), style: TextStyle(fontSize: 18)),
          Text('Nombre de votes : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          Text(film["vote_count"].toString(), style: TextStyle(fontSize: 18)),
          Text('Titre Officiel : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          Text(film["original_title"].toString(), style: TextStyle(fontSize: 18)),
          Text('Langue officielle : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          Text(film["original_language"].toString(), style: TextStyle(fontSize: 18)),

        ],
      )

      );
  }
}





