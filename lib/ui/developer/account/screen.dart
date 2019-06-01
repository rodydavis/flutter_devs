import 'package:flutter/material.dart';
import 'package:flutter_devs/data/models/index.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Consumer<AuthState>(
        builder: (context, model, child) => Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.redAccent,
                          child: Icon(Icons.person,
                              color: Colors.white, size: 50.0),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(top: 20),
                //   child: Text(
                //     'My Account',
                //     style: Theme.of(context).textTheme.display1,
                //   ),
                // ),
                if (model.account != null)
                  ListTile(
                    title: Text(model.account.name),
                    subtitle: Text(model.account.email),
                  ),

                ListTile(
                  title: RaisedButton(
                    child: Text('Logout'),
                    onPressed: () {
                      Navigator.pop(context);
                      model.logout();
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
