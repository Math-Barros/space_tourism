import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final Widget body;
  final String pageTile;

  ListScreen({required this.body, required this.pageTile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTile),
      ),
      body: Padding(
          padding: EdgeInsets.only(),
          child: SingleChildScrollView(
            child: body,
          )),
    );
  }
}
