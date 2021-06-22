import 'package:flutter/material.dart';
import 'package:demo4/home.dart';

class Workshops extends StatefulWidget {
  const Workshops({Key? key}) : super(key: key);

  @override
  _WorkshopsState createState() => _WorkshopsState();
}

class _WorkshopsState extends State<Workshops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workshops'),centerTitle:true,backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Contact'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Workshops')
          )
        ],
      ),
      body: Column(

        children: [
          Container(
            constraints: BoxConstraints.tightFor(height: 400.0),
            child: Image.network('https://miro.medium.com/max/700/1*Unvs2uoCWC3MxwGn3z0Hqw.png',
                fit:BoxFit.fitWidth ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png'),
            ),
            title: Text('Biker berlin '),
            subtitle: Column(
                children: [
                  Text('Adress: berliner strasse 57' ),
                  Text('Bikerberlin@gmail.com' ),
                  Text('+165236542136')
                ],


            ),
            isThreeLine: true,
            trailing: Icon(Icons.directions_bike),
          ),

          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png'),
            ),
            title: Text('Biker berlin '),
            subtitle: Column(
              children: [
                Text('Adress: berliner strasse 57' ),
                Text('Bikerberlin@gmail.com' ),
                Text('+165236542136')
              ],


            ),
            isThreeLine: true,
            trailing: Icon(Icons.directions_bike),
          ),



        ],
      ),
    );
  }

}

