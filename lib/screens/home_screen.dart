import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen.dart';
import '../screens/open_account.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(child: Column(
          children: [
            SizedBox(height: 100.0),
            Image(
              image: AssetImage('assets/images/farmer.jpg'),

            ),

            SizedBox(
              height: 30.0,
            ),




            SizedBox(
              height: 20.0,
            ),

            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                //Navigator.push(context, MaterialPageRoute(builder: (context) => farmerslist
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(
                            0xFF2E7D32), Color(0xff64B6FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                    BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),


            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                //Navigator.push(context, MaterialPageRoute(builder: (context) => farmerslist
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => openAccount()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(
                            0xFF2E7D32), Color(0xff64B6FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                    BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "CREATE ACCOUNT",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),



            SizedBox(
                height: 150.0),

            Text('© 2021 AFEX HANGOUT',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),

            )


          ],
        ),

      ),


)

    );

  }
}
