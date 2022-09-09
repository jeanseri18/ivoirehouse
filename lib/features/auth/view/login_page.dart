import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:house/features/auth/cubit/auth_cubit_cubit.dart';
import 'package:house/features/auth/view/register_page.dart';
import 'package:house/features/home/home_page.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/textfield_widget.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:house/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  void _saveAndRedirectToHome(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    log('ddde' + user.token.toString());
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => true);
  }

// @override
//   void initState() {
//    context.read<AuthCubit>().loginFetch(
//                           emailController.text, passwordController.text);
//     super.initState();
//   }
  @override
  Widget build(BuildContext context) {
    var s = '';
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
        title: '',
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Center(
                    child: Text(
                  'Connectez vous',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  'Entrez vos acces',
                  style: TextStyle(
                      color: greyBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWidget(
                  lib: 'Email',
                  nameController: emailController,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  lib: 'Mot de passe',
                  nameController: passwordController,
                  obscureText: false,
                ),
                BlocBuilder<AuthCubit, AuthCubitState>(
                  builder: (context, state) {
                    // log(state.toString());
                    if (state is AuthCubitLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is AuthCubitLoaded) {
                      if (state.user.data != null) {
                        _saveAndRedirectToHome(state.user.data as UserModel);
                        s = 'chargement';
                      } else {}
                      s = state.user.error.toString();
                    }

                    return Center(
                        // ignore: unnecessary_null_comparison
                        child: Text(
                      s.toString(),
                      style: TextStyle(color: greyBlue),
                    ));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      print('object');
                      context.read<AuthCubit>().loginFetch(
                          emailController.text, passwordController.text);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HomePage()),
                      // );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                          child: Text(
                        'Connexion',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                            'vous n avez pas de compte? Inscrivez vous'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
