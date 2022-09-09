import 'package:flutter/material.dart';
import 'package:house/features/account/view/account_page.dart';
import 'package:house/features/map/view/map_page.dart';
import 'package:house/features/post/view/post_page.dart';
import 'package:house/features/post/view/post_view_page.dart';
import 'package:house/features/search/view/search__page.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PostPage(),
     MapPage(),
    // SearchPage(),
    // AccountPage(),
  
    AccountPage(),
       MapPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      print('azazazaz');
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorWhite,
       
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: backgroundColorWhite,
        //   automaticallyImplyLeading: false,
        //   centerTitle: true,
        // ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Ionicons.logo_microsoft),
              label: '',
            ),
            //  BottomNavigationBarItem(
            //   icon: Icon(Ionicons.search_circle),
            //   label: '',
            // ),
             BottomNavigationBarItem(
              icon: Icon(Ionicons.add_circle_outline),
              label: '',
            ),
          
              
              BottomNavigationBarItem(
              icon: Icon(Ionicons.people_outline),
              label: '',
            ), BottomNavigationBarItem(
              icon: Icon(Ionicons.map),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: primary_one,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}