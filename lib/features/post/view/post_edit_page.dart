import 'package:flutter/material.dart';
import 'package:house/features/widget/widget_body.dart';

class PosteditPage extends StatefulWidget {
  const PosteditPage({ Key? key }) : super(key: key);

  @override
  State<PosteditPage> createState() => _PosteditPageState();
}

class _PosteditPageState extends State<PosteditPage> {
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