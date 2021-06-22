import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class drawer extends StatelessWidget {




  Future<void> _signOut(BuildContext context) async {

  }

  divider(BuildContext context){
    return Divider(
      indent: 15,
      endIndent: 15,
      thickness: 2,
      color: Theme.of(context).primaryColor,
      height: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15),
      ),
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[

              Container(
                height: 150.0,
                child: DrawerHeader(
                  child:  Text(
                    "Pit4Fits",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: (Color(0xff111084))),
                  ),
                  decoration: BoxDecoration(
                  ),
                ),
              ),





              customListTile(
                  label: "Home",
                  context: context,
                  onPressed:  () {
                   // Navigator.pushNamed(context, '/home');
                  }
              ),
              divider(context),




              customListTile(
                  label: "Workshop",
                  context: context,
                  onPressed:  () {
                    // Navigator.pushNamed(context, '/location');
                  }
              ),

              divider(context),// Spacer(),


              customListTile(
                  label: "AboutUs",
                  context: context,
                  onPressed:  () {
                    // Navigator.pushNamed(context, '/about');
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }
}

Widget customListTile({required String label, required BuildContext context, required Function onPressed}) {
  return ListTile(
      dense: true,
      title: Text(
        label,
        style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
      ),
      onTap: onPressed()
  );
}
