import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List <dynamic>results = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Text("Random API Users",style: TextStyle(color: Colors.deepPurple,fontSize: 20.0),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final res = results[index];
          final email = res['email'];
          return ListTile(
            leading: Text('${index+1}'),
            title: Text(email),
          );
        },
        itemCount: results.length,),
      floatingActionButton: FloatingActionButton(
        onPressed: Randomapi,
      ),

    );
  }

  void Randomapi() async {
    print('fetch data');
    final url = 'https://randomuser.me/api/?results=5000';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    setState(() {
      results = json['results'];
    });


    print('fetch data');
  }

}


