import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:house/model/api_response.dart';
import 'package:house/provider/auth_provider.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  final AuthApiProvider _apiProvider = AuthApiProvider();
  Future getAccounts() async {
    emit(AccountStateLoading());
    try {
      var result = await _apiProvider.getAccount();
      log("message");
      log('treste                     ' + result.data.toString());
      emit(AccountStateLoaded(result));
    } catch (e) {
      log('error' + e.toString());
      emit(AccountStateError(e.toString()));
    }
  }
}
