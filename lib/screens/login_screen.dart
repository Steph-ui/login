import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/data_model.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../providers/api_endpoint.dart';
class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AFEX HANGOUT'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
          color: Colors.black

          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => main_home()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(
              height: 30.0
            ),

            SizedBox(height:20.0),
            TextField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username'
              ),
              controller: nameController,
            ),

            SizedBox(
                height: 50.0
            ),
            TextField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password',
                hintText: 'Password',

              ),
              controller: passwordController,
            ),

            SizedBox(
              height: 30.0
            ),
            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                //Navigator.push(context, MaterialPageRoute(builder: (context) => farmerslist
                onPressed: () {
                 print (nameController.text);
                  print (passwordController.text);


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
            SizedBox(
              height: 30.0,
            ),
            Text('Forgot Password?'),
            Text('Reset here',

            style:TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold
            )
              ,),

            SizedBox(
              height: 50.0,
            ),
            Text('Dont have an account?',

            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),),


            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                //Navigator.push(context, MaterialPageRoute(builder: (context) => farmerslist
                onPressed: () {},
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


          ],

        ),
      ),    );
  }
}

