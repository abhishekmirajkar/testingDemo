import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:io';
import 'home.dart';
import 'home.dart';
import 'workshops.dart';
import 'workshops.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormBuilderState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        emailController.clear();
        nameController.clear();
        phoneController.clear();
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success"),
      content: Text("Will get in touch with you shortly!"),
      actions: [
        okButton,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pit4Fiets'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
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
          } else if (value == 1) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Workshops(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          }
        },
        currentIndex: 2, // this will be set when a new tab is tapped
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [ Text("Contact us"),],),
        Column(
          children: <Widget>[
            FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Column(children: [
                      FormBuilderTextField(
                        controller: nameController,

                        name: 'Name',
                        decoration: InputDecoration(
                          labelText:
                          'Name',
                        ),

                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.max(context, 70),
                        ]),
                        keyboardType: TextInputType.name,
                      ),

                      FormBuilderTextField(
                        controller: emailController,

                        name: 'Email',
                        decoration: InputDecoration(
                          labelText:
                          'Email',
                        ),

                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.max(context, 70),
                        ]),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      FormBuilderTextField(
                        controller: phoneController,
                        name: 'Phone',
                        decoration: InputDecoration(
                          labelText:
                          'Contact Number',
                        ),

                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.max(context, 70),
                        ]),
                        keyboardType: TextInputType.phone,
                      ),

                      SizedBox(height: 10,),
                      RaisedButton(onPressed: (){
                        showAlertDialog(context);

                      },child: Text("Submit"),color: Colors.blue,)
                    ],),
                  ),

                ],
              ),
            ),

          ],
        ),

            SizedBox(
              height: 20,
            ),
           Row(mainAxisAlignment: MainAxisAlignment.center,children: [ Text("About us"),],),
            SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                "assets/avatar.png",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
