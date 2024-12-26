// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


class Homeworlds {
  late var planetname;
  late var population;
  late var climate;

  Homeworlds({this.planetname='', this.population='',this.climate=''});
}


class Homeworld extends StatefulWidget {
  const Homeworld({super.key});

  @override
  State<Homeworld> createState() => _HomeworldState();
}

class _HomeworldState extends State<Homeworld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Space-6.jpg'),
            fit: BoxFit.fill,
          )
        ),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemCount: 60,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40.0,20.0,40.0,180.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}',
                            style: const TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 7.0),
                          Text(
                            'Name: ${homes[index]}',
                            style: const TextStyle(
                              fontFamily: 'Bruno',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 7.0),
                          Text(
                            'Population: ${population[index]}',
                            style: TextStyle(
                              fontFamily: 'Bruno',
                              color: Colors.red[400],
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 7.0),
                          Text(
                            'Climate: ${climates[index]}',
                            style: TextStyle(
                              fontFamily: 'Bruno',
                              color: Colors.purpleAccent[100],
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
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.amberAccent,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Icon(
                              Icons.share,
                            color: Colors.cyan,
                          ),
                      ),
                    ],
                  ),
                ],
              );
            },
        ),
      ),
    );
  }

  Homeworlds homeworld= Homeworlds();

  List<String> homes = [];
  List<String> population = [];
  List<String> climates = [];

  Future<void> getInfo(url) async{
    Response response = await get(Uri.parse("https://swapi.py4e.com/api/$url"));
    Map data = jsonDecode(response.body);

    setState(() {
      homeworld.planetname=data['name'];
      homeworld.population=data['population'];
      homeworld.climate=data['climate'];

      homes.add(homeworld.planetname);
      population.add(homeworld.population);
      climates.add(homeworld.climate);

    });
  }


  @override
  void initState() {
    super.initState();
    for (int i = 1;i<61;i++){
      getInfo('planets/$i/');
    }
  }
}