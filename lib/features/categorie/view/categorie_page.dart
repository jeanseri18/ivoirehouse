import 'package:flutter/material.dart';
import 'package:house/features/widget/widget_body.dart';

class CategoriePage extends StatefulWidget {
  const CategoriePage({ Key? key }) : super(key: key);

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  @override
  Widget build(BuildContext context) {
 return SafeArea(
      child: WidgetAppBar(
        actions: Container(),
        leading: Container(),
        title: 'Bienvenue ',
        body: Container(),
      ),
    );  }
}