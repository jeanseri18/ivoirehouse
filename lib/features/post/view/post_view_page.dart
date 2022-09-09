import 'package:flutter/material.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:ionicons/ionicons.dart';

class PostViewPage extends StatefulWidget {
  const PostViewPage({Key? key}) : super(key: key);

  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetAppBar(
        actions: Container(),
        leading: Container(),
        title: 'Bienvenue ',
        body: PageView(
          controller: PageController(initialPage: 11),
          children: <Widget>[
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Image.asset('images/women.png'),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage("images/women.png"),
                            fit: BoxFit.cover,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(children: [
                          Positioned(
                            bottom: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Ionicons.woman,
                                        size: 30, color: Colors.blue),
                                    Text(
                                      'jean setone',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: const [
                                    Icon(Ionicons.location_outline,
                                        size: 30, color: Colors.red),
                                    Text(
                                      'jean setone',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: const Text(
                                    'jean setone dfcyvubin, txfyctuvibonp,;m zrtyunkml, rctvhybkjlnkTRDTVBN?L YTVYBNK',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      )),
                ),
                SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Ionicons.call_outline,
                            size: 30, color: Colors.blue),
                      ),
                      const Text(
                        ' jean setone',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
