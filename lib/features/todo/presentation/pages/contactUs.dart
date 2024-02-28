import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Contact Us"),
      drawer: drawer(context),
      body: Center(
        child: Text(
          "Contact Us",
        ),
      ),
    );
  }
}
