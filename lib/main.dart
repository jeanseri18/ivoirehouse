import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house/features/account/logic/account_cubit.dart';
import 'package:house/features/auth/cubit/auth_cubit_cubit.dart';
import 'package:house/features/home/home_page.dart';
import 'package:house/features/onboard/onboard_page.dart';
import 'package:house/features/post/cubit/post_cubit.dart';
import 'package:house/provider/auth_provider.dart';

void main() async{
    //  String? token = await AuthApiProvider().getToken();
  // String token ='';
  
  runApp(
    MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(),
    ),BlocProvider(
      create: (context) => AccountCubit(),
    ),
    BlocProvider(
      create: (context) => PostCubit(),
    ),
    
  ], child: MyApp()));
  // : 
  // MultiBlocProvider(providers: [
  //   BlocProvider(
  //     create: (context) => AuthCubit(),
  //   ),
  //   BlocProvider(
  //     create: (context) => PostCubit(),
  //   )
  // ], child: MyAppHome())
  
  // );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardPage(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  const MyAppHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
