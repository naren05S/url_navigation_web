import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String name;
  final String extra;

  const About(this.name,this.extra);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
          color: Colors.green,
          child: Center(
            child: Text(
              'About Page ... :D and here is the Parameter passed.... $name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
        ),
          Container(
            height: 200,
            color: Colors.red,
            child: Center(
              child: Text(
                'About Page ... :D and here is the Parameter passed.... $extra',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// only in this page i have added the name parameter to check the second paramter that is passed.....