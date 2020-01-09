import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movie3_list/Page2.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'https://api.themoviedb.org/3/discover/movie?api_key=26a927d904e004536f41f3ba1f836018&primary_release_year=2019&sort_by=vote_average.desc';
  List data;



  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["results"];
    });



  }





  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Movie List'),
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              if(data[i]["poster_path"]!= null){
                return new ListTile(
                  leading: new CircleAvatar(
                      backgroundImage: new NetworkImage("https://image.tmdb.org/t/p/w600_and_h900_bestv2" + data[i] ["poster_path"])

                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),

                  title: new Text(data[i]["title"]),
                  subtitle : new Text(data[i]["popularity"].toString()),

                  onTap: (){

                    debugPrint('${data[i]["title"]} was taped');
                    PageDesc(data[i]);
                  },
                );



              }


              else {
                return new ListTile(
                    title: new Text(data[i]["title"]),
                    subtitle : new Text(data[i]["vote_average"].toString()),
                    leading: CircleAvatar(backgroundColor: Colors.blue,),
                    trailing: Icon(Icons.keyboard_arrow_right),


                    onTap: (){
                      debugPrint('${data[i]["title"]} was taped');
                      PageDesc(data[i]);
                    }


                );

              }


            }));




  }


  void PageDesc(data){
    int i =0;
    Navigator.push(context,
        new MaterialPageRoute(builder: (context){
          return new Page2(data);
        }));

  }



}



