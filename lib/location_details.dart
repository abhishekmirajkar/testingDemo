import 'package:flutter/material.dart';
import 'models/location.dart';

class LocationDetail extends StatelessWidget {
  final Location location;

  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(location.name)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[Container(
            constraints: BoxConstraints.tightFor(height: 170.0),
            child: Image.network('',
                fit:BoxFit.fitWidth ),
          ),
          Column(
            children: _renderFacts(location),
          )
          ]
          

        )
    );
  }


  List<Widget> _renderFacts(Location location) {
    var result = <Widget>[];
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }


  Widget _sectionTitle(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(text ,
      textAlign: TextAlign.left,),
    );
  }

  Widget _sectionText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25,10),
        child: Text(text));
  }


}