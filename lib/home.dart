import 'package:flutter/material.dart';
import 'models/location.dart';
import 'package:demo4/location_details.dart';
import 'mocks/mock_location.dart';

class Home extends StatelessWidget {
  final Location location;
  Home(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Pit4Fiets'),centerTitle:true,backgroundColor: Colors.blue,
        leading: GestureDetector(
          onTap: (){
            /*  write a code for menu bar in home screen    */
          },
          child: Icon(Icons.menu) ,
        ),
        actions: <Widget>[
          actionmenu(Icons.search),
          actionmenu(Icons.more_vert),

        ],

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children:<Widget>[
              Expanded(
                  flex: 4,
                  child: Container()),
              Expanded(
                child: FlatButton(onPressed: (){},
                  child: Text('Home'),
                ),
              ),
              Expanded(
                child: FlatButton(onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                    child: Text('Workshops')
                ),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text('About us')
                ),
              )
            ],


          ),
          Container(
            constraints: BoxConstraints.tightFor(height: 400.0),
            child: Image.network('https://thumbs.dreamstime.com/z/bike-mechanic-repairs-bicycle-workshop-closeup-portrait-young-blurred-man-examines-fixes-modern-cycle-transmission-129983969.jpg',
                fit:BoxFit.fitWidth ),
          ),

          Column(
            children: _renderFacts(location),
          )

        ],
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

  Widget section( String title , Color color){

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      child: Text('title'),

    );
  }

  Widget actionmenu ( icon) {
    return Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            icon ,
            size: 26.0,
          ),
        )
    );
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

  List<Widget> _renderFacts(Location location) {
    var result = <Widget>[];
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }



}

