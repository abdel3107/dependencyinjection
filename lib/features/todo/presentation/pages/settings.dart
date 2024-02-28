import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Settings"),
      drawer: drawer(context),
      body: Center(
        child: Text(
          "Settings"
        ),
      ),
    );
  }
}
