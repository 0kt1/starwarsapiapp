import 'package:flutter/material.dart';
import 'package:starwarsapiapp/loading.dart';



void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
      })
  );
}

