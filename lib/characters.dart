// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class peoples {
  late var Name;
  late var BirthYear;
  late var Gender;
  late var Height;
  late var Weight;

  peoples({this.Name='',this.BirthYear='',this.Gender='',this.Height='',this.Weight=''});
}


class People extends StatefulWidget {
  const People({super.key});


  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Space-2.jpg'),
              fit: BoxFit.fill,
            )
          ),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemCount: 82,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: [
                    Card(
                      color: Colors.transparent,
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 180.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  fontFamily: 'Bruno',
                                  color: Colors.lightGreenAccent,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 7.0),
                            Text(
                                'Name: ${personsnames[index]}',
                              style: const TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 7.0),
                            Text(
                              'Birthyear: ${personsbirthyears[index]}',
                              style: TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.amberAccent[700],
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height:7.0),
                            Text(
                              'Gender: ${personsgender[index]}',
                              style: const TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 7.0),
                            Text(
                              'Height: ${personsheight[index]}',
                              style: TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height:7.0),
                            Text(
                              'Mass: ${personsweight[index]}',
                              style: const TextStyle(
                                fontFamily: 'Bruno',
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],//children
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
                            color: Colors.cyan,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        //SizedBox(width: 5.0),
                        TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.share,
                            color: Colors.limeAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
          ),
        ),
      ),
    );
  }
  peoples character= peoples();

  List<String> personsnames = [];
  List<String> personsbirthyears = [];
  List<String> personsgender = [];
  List<String> personsheight = [];
  List<String> personsweight = [];

  Future<void> getInfo(url) async{
    Response response = await get(Uri.parse("https://swapi.py4e.com/api/$url"));
    Map data = jsonDecode(response.body);


    setState(() {
      character.Name=data['name'];
      character.BirthYear=data['birth_year'];
      character.Gender=data['gender'];
      character.Height=data['height'];
      character.Weight=data['mass'];

      personsnames.add(character.Name);
      personsbirthyears.add(character.BirthYear);
      personsgender.add(character.Gender);
      personsheight.add(character.Height);
      personsweight.add(character.Weight);

    });
  }


  @override
  void initState() {
    super.initState();
    for (int i = 1;i<84;i++){
      getInfo('people/$i/');
    }
  }

}