import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


class Films {
  late var moviename;
  late var director;
  late var releasedate;

  Films({this.moviename='',this.director='',this.releasedate=''});
}


class Movies extends StatefulWidget {
  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Space.jpg'),
              fit: BoxFit.fill,
            )
        ),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index){
              return Container(
                child: Column(
                  children: [
                    Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 180.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}',
                              style: TextStyle(
                                  fontFamily: 'Bruno',
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 7.0),
                            Text(
                              'Title: ${movies[index]}',
                              style: TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.lightGreenAccent,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 7.0),
                            Text(
                              'Director: ${directors[index]}',
                              style: TextStyle(
                                fontFamily: 'Bruno',
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 7.0),
                            Text(
                              'Release Date: ${releases[index]}',
                              style: TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.pinkAccent,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        //SizedBox(width: 5.0),
                        TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.share,
                            color: Colors.tealAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
        },
        ),
      ),
    );
  }

  Films film= Films();

  List<String> movies = [];
  List<String> directors = [];
  List<String> releases = [];

  Future<void> getInfo(url) async{
    Response response = await get(Uri.parse("https://swapi.dev/api/$url"));
    Map data = jsonDecode(response.body);

    setState(() {
     film.moviename=data['title'];
     film.director=data['director'];
     film.releasedate=data['release_date'];

      movies.add(film.moviename);
      directors.add(film.director);
      releases.add(film.releasedate);

    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 1;i<7;i++){
      getInfo('films/$i/');
    }
  }
}