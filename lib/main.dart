import 'package:flutter/material.dart';
import 'package:demo4/home.dart';
import 'package:demo4/workshops.dart';
import 'package:demo4/contact.dart';
import 'package:demo4/mocks/mock_location.dart';
import 'package:demo4/models/location.dart';
import 'package:demo4/location_details.dart';


void main() {
  final Location mockLocation = MockLocation.FetchAny();
  runApp(MaterialApp(

    home: Home(mockLocation),
    routes: {
      '/home': (context) => Home(mockLocation),
      '/location':(context) => Workshops(),
      '/about':(context)=> Contact()
    },

  ));
}


