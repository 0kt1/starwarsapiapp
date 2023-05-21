import 'package:flutter/material.dart';

class Starships extends StatelessWidget {
  const Starships({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 14,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Text(
                  'Starship'
              ),
            );
          }
      ),
    );
  }
}
