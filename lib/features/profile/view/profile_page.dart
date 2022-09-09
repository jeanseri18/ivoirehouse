import 'package:flutter/material.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetAppBar(
        isAppBar: true,
        actions: Container(),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: ' ',
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: ClipRRect(
                borderRadius: new BorderRadius.circular(50.0),
                child: const Image(
                  fit: BoxFit.fill,
                  image: AssetImage('images/women.png'),
                  width: 100.0,
                  height: 100.0,
                ),
              )),
             const Text('@jeanseri'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Expanded(
                    child: ListTile(
                      title: Center(
                        child: Text(
                        'vue',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                                      ),
                      ),
                                    subtitle: Center(
                                      child: Text(
                      'vue',
                      style: TextStyle(
                          color: Colors.black,
                         
                          fontSize: 16),
                                      ),
                                    ),
                    ),
                  ),SizedBox(width: 40,),
                  Expanded(
                    child: ListTile(
                      title: Center(
                        child: Text(
                        'Abonnées',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                                      ),
                      ),
                                    subtitle: Center(
                                      child: Text(
                      'Abonnées',
                      style: TextStyle(
                          color: Colors.black,
                         
                          fontSize: 16),
                                      ),
                                    ),
                    ),
                  )
                ],
              )
              ,
              SizedBox(height: MediaQuery.of(context).size.height * 0.8,
                child: DefaultTabController(
                length: 2,
                child: Scaffold(  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,elevation: 0,toolbarHeight:0,
                    
                    bottom: TabBar(indicatorColor:primary_one,
                    unselectedLabelColor:Colors.black,
                    labelColor:primary_one,
                      tabs: [
                        Tab(icon: Icon(Ionicons.apps_outline)),
                        Tab(icon: Icon(Ionicons.logo_youtube)),
                        
                     
                      ],
                    ),
                  ),body: TabBarView (
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
               
                ],
                            )
                ),
                            ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
