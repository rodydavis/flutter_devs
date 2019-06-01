import 'package:flutter/material.dart';

class CurrentProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Projects'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item; $index'),
          );
        },
        itemCount: 100,
      ),
    );
  }
}
