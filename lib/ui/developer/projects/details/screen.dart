import 'package:flutter/material.dart';
import 'package:flutter_devs/data/classes/project.dart';

import 'package:timeago/timeago.dart' as timeago;

class ProjectDetailsScreen extends StatelessWidget {
  ProjectDetailsScreen({
    @required this.project,
  });
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Details'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Project Name'),
            subtitle: Text(project.name),
          ),
          ListTile(
            title: Text('Project Hours'),
            subtitle: Text(project.hours.toString()),
          ),
          ListTile(
            title: Text('Created'),
            subtitle: Text(timeago.format(project.dateCreated)),
          ),
          ListTile(
            title: Text('Description'),
            subtitle: Text(project.description),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.monetization_on),
        label: Text('Claim Project'),
        onPressed: () {},
      ),
    );
  }
}
