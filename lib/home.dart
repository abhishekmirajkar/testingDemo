import 'package:flutter/material.dart';
import 'contact.dart';
import 'models/location.dart';
import 'package:demo4/location_details.dart';
import 'mocks/mock_location.dart';
import 'package:demo4/drawer.dart';

import 'workshops.dart';
import 'workshops.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pit4Fiets'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          actionmenu(Icons.search),
          actionmenu(Icons.more_vert),
        ],
      ),
      //drawer: drawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          if(value == 1 ){
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Workshops(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          }else if(value == 2){
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Contact(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          }
        },
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Workshops')),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Contact'),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset("assets/img1.jpg"),
            ),
            _sectionTitle("Hello Riders"),
            _sectionText(
                "While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm"),
            _sectionTitle("Hello Riders"),
            _sectionText(
                "While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget section(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: Text('title'),
    );
  }

  Widget actionmenu(icon) {
    return Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            icon,
            size: 26.0,
          ),
        ));
  }

  Widget _sectionTitle(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(
        text,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _sectionText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 10), child: Text(text));
  }
}
