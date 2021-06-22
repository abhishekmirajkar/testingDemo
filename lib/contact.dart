import 'package:flutter/material.dart';



class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Pit4Fiets'),centerTitle:true,backgroundColor: Colors.blue,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                    Icons.more_vert
                ),
              )
          ),
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
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text('one'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text('two'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text('three'),
          ),
        ],
      ),







    );
  }
}
