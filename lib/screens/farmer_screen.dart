import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import 'dart:convert' as convert;

import 'package:untitled2/providers/api_provider.dart';

class FarmerScreen extends StatefulWidget {
  @override
  _FarmerScreenState createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen> {
  var apiCall = ApiProvider();

  Future<List<Farmer>> getFarmerList() async {
    print("ghghfjhjj");
    var response = await apiCall.getFarmerList();
    print("response: ${response.responseCode}");
    print("response: ${response.statusCode}");
    if (response.isRequestSuccessful())
      return response.farmers!.farmers;
    else
      return [];
  }

  @override
  void initState() {
    //getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text(
          'Afex Farmers',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder<List<Farmer>>(
            future: getFarmerList(),
            builder: (context, snapshot) {
              var data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (data != null && data.isEmpty) {
                return Center(child: Text('no data found'));
              }

              // check if snapshot has data

              //title folio
              //subtitle first and last name
              //leading image
              //trailing cooperative

              return Container(
                  child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: FadeInImage.assetNetwork(
                      placeholder: "assets/images/profile.png",
                      image: data[i].picture!,
                      imageErrorBuilder: (context, object, ex){
                        return Image.asset('assets/images/profile.png');
                      },
                    ),
                    subtitle: Text("${data[i].firstName!} ${data[i].lastName!}"),
                    title: Text(data[i].folioId!),
                    trailing: Text(data[i].cooperativeId!),
                  );
                },
              ));
            },
          ),
        ),
      ),
    );
  }
}
