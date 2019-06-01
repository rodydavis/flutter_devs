import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_devs/data/models/index.dart';
import 'package:flutter_devs/ui/client/home.dart';
import 'package:flutter_devs/ui/developer/home.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_ui/flutter_firebase_ui.dart';
// import 'package:firebase_ui/l10n/localization.dart';
import 'package:dart_firebase/api.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, model, child) {
        if (!model.loggedIn) {
          return LoginScreen();
        }
        return MainScreen();
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, model, child) {
        if (model.isDeveloper) {
          return DeveloperHome();
        }
        return ClientHome();
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Findevs',
                      style: Theme.of(context).textTheme.headline,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Text(
                          'Pick a Side!',
                          style: Theme.of(context).textTheme.display1,
                        )),
                        Container(
                            child: Text(
                          'The app will change depending on your user login.',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30.0),
                    child: Consumer<AuthState>(
                      builder: (context, model, child) => Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: RaisedButton(
                                  color: Colors.blueAccent,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Client',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    model.login(false);
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: RaisedButton(
                                  color: Colors.blueGrey,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Developer',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    model.login(true);
                                  },
                                ),
                              ),
                            ],
                          ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    // return SignInScreen(
    //   title: "Login",
    //   header: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 60.0),
    //     child: FlutterLogo(size: 120.0),
    //   ),
    //   showBar: true,
    //   padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
    //   avoidBottomInset: true,
    //   // color: Color(0xFF363636),
    //   providers: [
    //     ProvidersTypes.google,
    //     // ProvidersTypes.facebook,
    //     // ProvidersTypes.twitter,
    //     // ProvidersTypes.email
    //   ],
    //   // twitterConsumerKey: "",
    //   // twitterConsumerSecret: "",
    // );
  }
}
