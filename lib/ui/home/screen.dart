import 'package:flutter/material.dart';
import 'package:flutter_devs/data/models/index.dart';
import 'package:flutter_devs/ui/client/home.dart';
import 'package:flutter_devs/ui/developer/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:firebase_ui/l10n/localization.dart';

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
    return SignInScreen(
      title: "Login",
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        child: FlutterLogo(size: 120.0),
      ),
      showBar: true,
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      avoidBottomInset: true,
      // color: Color(0xFF363636),
      providers: [
        ProvidersTypes.google,
        // ProvidersTypes.facebook,
        // ProvidersTypes.twitter,
        // ProvidersTypes.email
      ],
      // twitterConsumerKey: "",
      // twitterConsumerSecret: "",
    );
  }
}
