import 'package:flutter/material.dart';
import 'package:demo4/home.dart';

import 'contact.dart';
import 'contact.dart';
import 'data.dart';
import 'home.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Workshops extends StatefulWidget {
  const Workshops({Key? key}) : super(key: key);

  @override
  _WorkshopsState createState() => _WorkshopsState();
}

class _WorkshopsState extends State<Workshops> {

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget bookButton = FlatButton(
      child: Text("Book"),
      onPressed: () {
        Navigator.pop(context);
        dateWid();
      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Select"),
      content:Container(
        height: 150,
        child: Column(children: [
          FormBuilderDateTimePicker(
            name: 'date',
            // onChanged: _onChanged,
            inputType: InputType.time,
            decoration: InputDecoration(
              labelText: 'Select Time',
            ),
            initialTime: TimeOfDay(hour: 8, minute: 0),
            // initialValue: DateTime.now(),
            // enabled: true,
          ),
          FormBuilderDateRangePicker(
            name: 'date_range',
            firstDate: DateTime(1970),
            lastDate: DateTime(2030),


            decoration: InputDecoration(
              labelText: 'Date Range',

            ),
          ),

        ],),
      ),
      actions: [
        bookButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Widget dateWid(){
    return  FormBuilderDateTimePicker(
      name: 'date',
      // onChanged: _onChanged,
      inputType: InputType.time,
      decoration: InputDecoration(
        labelText: 'Appointment Time',
      ),
      initialTime: TimeOfDay(hour: 8, minute: 0),
      // initialValue: DateTime.now(),
      // enabled: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workshops'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Home(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          } else if (value == 2) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Contact(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          }
        },
        currentIndex: 1, // this will be set when a new tab is tapped
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              constraints: BoxConstraints.tightFor(height: 280.0),
              child: Image.network(
                  'https://miro.medium.com/max/700/1*Unvs2uoCWC3MxwGn3z0Hqw.png',
                  fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png'),
                  ),
                  title: Text('${data[i]['name']}'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${data[i]['address']}'),
                          Text('${data[i]['email']}'),
                          Text('${data[i]['phone']}'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         FlatButton(onPressed: (){
                           showAlertDialog(context);
                         }, child:  Icon(Icons.add),),
                          SizedBox(height: 40,),
                        ],
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Icon(Icons.directions_bike),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
