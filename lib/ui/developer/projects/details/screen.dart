import 'package:flutter/material.dart';
import 'package:flutter_devs/data/classes/project.dart';

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
            title: Text(project.name),
          )
        ],
      ),
    );
  }
}
