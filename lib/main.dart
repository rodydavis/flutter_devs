import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'data/models/auth_state.dart';
import 'data/models/index.dart';
import 'ui/home/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AuthState>(
          builder: (_) => AuthState()..init(),
        ),
        ListenableProvider<ClientState>(
          builder: (_) => ClientState()..init(),
        ),
        ListenableProvider<DeveloperState>(
          builder: (_) => DeveloperState()..init(),
        ),
        ListenableProvider<ProjectState>(
          builder: (_) => ProjectState()..init(),
        ),
      ],
      child: Theming(
        builder: (theme) => MaterialApp(
              title: 'Flutter Devs',
              theme: theme,
              home: HomeScreen(),
            ),
      ),
    );
  }
}

class Theming extends StatelessWidget {
  Theming({
    @required this.builder,
  });
  final Widget Function(ThemeData theme) builder;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: builder(
        ThemeData.light().copyWith(
          cardTheme: CardTheme(
            elevation: 12.0,
            clipBehavior: Clip.hardEdge,
          ),
        ),
      ),
    );
  }
}
