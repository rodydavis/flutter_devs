import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/classes/project.dart';
import '../../../data/models/index.dart';
import '../../developer/projects/screen.dart';

class CurrentProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectState>(
      builder: (context, model, child) => Scaffold(
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
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 75,
                  leading: AccountButton(),
                  title: Text('Current Projects'),
                  actions: <Widget>[
                    FilterButton(),
                  ],
                ),
                if (model?.projects == null || model.projects.isEmpty) ...[
                  SliverFillRemaining(
                      child: Center(
                    child: Text(
                      'No Projects Avaliable',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ))
                ] else ...[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final _item = model.projects[index];
                        return NewProjectItem(project: _item);
                      },
                      childCount: model.projects.length,
                    ),
                  ),
                ],
              ],
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
    bounty: 9.99,
    hours: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _formKey.currentState.save();
              Navigator.pop(context, _project);
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Project Name', labelText: 'Project Name'),
                initialValue: _project?.name,
                onSaved: (val) => _project?.name = val,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Project Description',
                    labelText: 'Project Description'),
                initialValue: _project?.description,
                onSaved: (val) => _project?.description = val,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Project Cost', labelText: 'Project Cost'),
                initialValue: _project?.bounty?.toString(),
                onSaved: (val) => _project?.bounty = double?.tryParse(val),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Project Hours', labelText: 'Project Hours'),
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
