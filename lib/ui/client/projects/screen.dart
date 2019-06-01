import 'package:flutter/material.dart';
import 'package:flutter_devs/data/models/index.dart';
import 'package:flutter_devs/ui/developer/projects/screen.dart';
import 'package:provider/provider.dart';

class CurrentProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectState>(
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              leading: AccountButton(),
              title: Text('Current Projects'),
              actions: <Widget>[
                FilterButton(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddProjectScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            body: Builder(
              builder: (_) {
                if (model?.projects == null || model.projects.isEmpty) {
                  return Center(
                    child: Text(
                      'No Projects Avaliable',
                      style: Theme.of(context).textTheme.title,
                    ),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final _item = model.projects[index];
                    return NewProjectItem(project: _item);
                  },
                  itemCount: model.projects.length,
                );
              },
            ),
          ),
    );
  }
}

class AddProjectScreen extends StatefulWidget {
  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
