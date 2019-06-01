import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'data/models/auth_state.dart';
import 'data/models/index.dart';
import 'ui/home/screen.dart';

/// main is entry point of Flutter application
void main() {
  // Desktop platforms aren't a valid platform.
  _setTargetPlatformForDesktop();
  return runApp(MyApp());
}

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

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
          debugShowCheckedModeBanner: false,
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
