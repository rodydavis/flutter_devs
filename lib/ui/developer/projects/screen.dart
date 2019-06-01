import 'package:flutter/material.dart';
import 'package:flutter_devs/ui/developer/account/screen.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../data/classes/project.dart';
import '../../../data/models/project_state.dart';
import 'details/screen.dart';

class NewProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectState>(
      builder: (context, model, child) => Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 75,
                  leading: AccountButton(),
                  title: Text('New Projects'),
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

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AccountScreen(),
              fullscreenDialog: true,
            ),
          );
        },
        child: CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Consumer<ProjectState>(
                builder: (context, state, child) => SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(height: 10.0),
                          Container(
                            child: ListTile(
                              title: Text('Sort Field'),
                              trailing: DropdownButton<SortValue>(
                                value: state.field,
                                onChanged: state.changeField,
                                items: [
                                  DropdownMenuItem<SortValue>(
                                    value: SortValue.date,
                                    child: Text('Date Created'),
                                  ),
                                  DropdownMenuItem<SortValue>(
                                    value: SortValue.price,
                                    child: Text('Bounty Amount'),
                                  ),
                                  DropdownMenuItem<SortValue>(
                                    value: SortValue.hours,
                                    child: Text('Hours'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              title: Text('Sort Accending'),
                              trailing: Switch.adaptive(
                                value: state.accending,
                                onChanged: state.changeAccending,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
          },
        );
      },
    );
  }
}

class NewProjectItem extends StatelessWidget {
  const NewProjectItem({
    Key key,
    @required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(child: Text(project.hours.toString())),
          title: Text(project.name),
          subtitle: Text(timeago.format(project.dateCreated)),
          trailing: Text('\$${project.bounty.toStringAsFixed(2)}'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProjectDetailsScreen(project: project),
            ));
          },
        ),
      ),
    );
  }
}
