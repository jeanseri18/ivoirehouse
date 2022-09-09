import 'package:flutter/material.dart';
import 'package:house/features/theme/colors.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({
    Key? key,
    required this.title,
    required this.leading,
    required this.actions,
    required this.body,  this.isAppBar=false, this.bg=Colors.white
  }) : super(key: key);
  final String title;
  final Widget leading;
  final Widget actions;
  final Widget? body;
  final bool isAppBar;
  final Color bg;
  @override
  Widget build(BuildContext context) {
    return !isAppBar ? Scaffold(
        backgroundColor: bg,
        resizeToAvoidBottomInset: false,
        
        body: body):
    
    
     Scaffold(
        backgroundColor: bg,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            title,
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26,fontStyle: FontStyle.italic),
          ),
          leading: leading,
          actions: [actions],
        ),
        body: body);
  }
}
