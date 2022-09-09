import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house/features/auth/cubit/auth_cubit_cubit.dart';
import 'package:house/features/auth/view/login_page.dart';
import 'package:house/features/home/home_page.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/textfield_widget.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:house/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmedpasswordController = TextEditingController(),
      pseudoController = TextEditingController();
  var error = '';

  void _saveAndRedirectToHome(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

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
                  'Inscrivez vous',
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
                  lib: 'Pseudo',
                  nameController: pseudoController,
                  obscureText: false,
                ),
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
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  lib: 'Confirmation du mot de passe',
                  nameController: confirmedpasswordController,
                  obscureText: true,
                ),
                BlocBuilder<AuthCubit, AuthCubitState>(
                  builder: (context, state) {
                    log(state.toString());
                    if (state is AuthCubitLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is AuthCubitLoaded) {
                      log(state.user.data.toString());
                      if (state.user.error == null) {
                        _saveAndRedirectToHome(state.user.data as UserModel);

                        error = 'chargement';
                      } else {}
                      error = state.user.error.toString();
                    }

                    return Center(
                        child: Text(
                      // ignore: unnecessary_null_comparison
                      error == null ? '' : error.toString(),
                      style: const TextStyle(color: Colors.black),
                    ));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthCubit>().register(
                            pseudoController.text,
                            emailController.text,
                            passwordController.text);
                      
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
                        'Inscription',
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
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child:
                            const Text('vous avez un compte? Connectez vous'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
