import 'package:flutter/material.dart';
import 'package:mapboxmaps/src/views/fullscreenmaps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MapBox - Maps',
      home: Scaffold(body: FullScreenMaps()),
    );
  }
}
