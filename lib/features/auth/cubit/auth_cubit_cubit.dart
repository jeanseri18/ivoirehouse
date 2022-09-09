

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:house/model/api_response.dart';
import 'package:house/model/user_model.dart';
import 'package:house/provider/auth_provider.dart';

import 'package:meta/meta.dart';


part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  final AuthApiProvider _apiProvider = AuthApiProvider();
  Future loginFetch(String email, String password) async {
    emit(AuthCubitLoading());
    try {

      var result = await _apiProvider.login(email, password);
      log(result.data.toString());
      emit(AuthCubitLoaded(result));
    } catch (e) {
      emit(AuthCubitError(e.toString()));
    }
  }

  Future register(String name, String email, String password) async {
    emit(AuthCubitLoading());
    try {
      var result = await _apiProvider.register(name, email, password);
      emit(AuthCubitLoaded(result));
    } catch (e) {
      emit(AuthCubitError(e.toString()));
    }
  }

  
}
