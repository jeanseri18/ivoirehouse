import 'package:flutter/material.dart';
import 'package:house/features/widget/widget_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: WidgetAppBar(
        actions: Container(),
        leading: Container(),
        title: 'Bienvenue ',
        body: Container(),
      ),
    );
  }
}

