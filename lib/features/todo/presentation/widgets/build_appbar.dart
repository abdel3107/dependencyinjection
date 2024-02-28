import 'package:flutter/material.dart';


AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
  );
}