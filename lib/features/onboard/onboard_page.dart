import 'package:flutter/material.dart';
import 'package:house/features/auth/view/login_page.dart';
import 'package:house/features/auth/view/register_page.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:panorama/panorama.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetAppBar(
        actions: Container(),
        leading: Container(),
        title: 'Bienvenue ',
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Panorama(
          child: Image.asset('images/faces-gd26658f88_1920.jpg'),
        ),
        
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.7,
                // decoration: const BoxDecoration(
                //   color: Colors.white,
                //   image: DecorationImage(
                //     image: AssetImage("images/social-media-g5b49de17d_1920.png"),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: const Center(
                          child: Text(
                        'Bienvenue',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                    )),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: primary_one,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                      child: Text(
                    'Connectez vous',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                      child: Text(
                    'Inscrivez vous',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              )

              // Center(child: Image.asset('images/women.png'))
            ],
          ),
        ),
      ),
    );
  }
}
