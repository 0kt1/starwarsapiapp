// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'movies.dart';
import 'planets.dart';
import 'characters.dart';
import 'Starships.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  void NavigateToIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }



  final List<Widget> _list = [
    const People(),
    const Movies(),
    const Homeworld(),
    const Starships()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'StarWars',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Bruno',
              ),
            ),
            elevation: 0.0,
            backgroundColor: Colors.black,
            flexibleSpace: const Image(
              image: AssetImage('assets/Space-4.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          body: _list[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            elevation: 0.0,
            currentIndex: _currentIndex,
            onTap: NavigateToIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.face, color: Colors.white), label: 'Characters'),
              BottomNavigationBarItem(icon: Icon(Icons.local_movies_sharp, color: Colors.white), label: 'Movies'),
              BottomNavigationBarItem(icon: Icon(Icons.flag_circle, color: Colors.white), label: 'Planets'),
            ],
            selectedItemColor: Colors.cyanAccent,
            selectedLabelStyle: const TextStyle(fontFamily: 'Amatic',fontSize: 20.0, fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Bruno',fontSize: 10.0),
            unselectedItemColor: Colors.teal,
          ),
        ),
    );

  }
}
