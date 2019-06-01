import 'package:flutter/material.dart';
import 'package:flutter_devs/data/classes/project.dart';
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
                Navigator.push<Project>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddProjectScreen(),
                    fullscreenDialog: true,
                  ),
                ).then((val) {
                  if (val != null) {
                    model.add(val);
                  }
                });
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
  final _formKey = GlobalKey<FormState>();
  Project _project = Project(
    name: '',
    dateCreated: DateTime.now(),
    openSourced: true,
    description: '',
    bounty: 0,
    hours: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Project Name'),
                initialValue: _project?.name,
                onSaved: (val) => _project?.name = val,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Project Description '),
                initialValue: _project?.description,
                onSaved: (val) => _project?.description = val,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Project Cost'),
                initialValue: _project?.bounty?.toString(),
                onSaved: (val) => _project?.bounty = double?.tryParse(val),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Project Hours'),
                initialValue: _project?.hours?.toString(),
                onSaved: (val) => _project?.hours = int?.tryParse(val),
              ),
            ),
            Container(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Open Sourced'),
                  trailing: Switch.adaptive(
                    value: _project?.openSourced,
                    onChanged: (val) {
                      if (mounted)
                        setState(() {
                          _project?.openSourced = val;
                        });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
