import 'package:flutter/material.dart';
import 'package:starwarsapiapp/home.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void gettoHome() async{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Space.jpg'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 70.0),
                Container(child: Image.asset('assets/Star_Wars_Logo.png')),
                SizedBox(height: 100.0),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '"A Long Time Ago In a Galaxy Far, Far Away..."',
                      style: TextStyle(
                        color: Colors.amber[300],
                        fontSize:25.0,
                        fontFamily: 'Amatic',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gettoHome();
        },
        child: Text(
          'GO',
          style: TextStyle(
            fontFamily: 'Bruno',
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
