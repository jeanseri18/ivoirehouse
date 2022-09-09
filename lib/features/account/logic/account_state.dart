part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}
class AccountStateLoading extends AccountState {

  List<Object?> get props => [];
}
class AccountStateLoaded extends AccountState {
  final ApiResponse1  account;
  AccountStateLoaded(this.account);
  List<Object?> get props => [account];
}
class AccountStateLoadedLimit extends AccountState {
  final ApiResponse1  account;
  AccountStateLoadedLimit(this.account);
  List<Object?> get props => [account];
}

class AccountStateError extends AccountState {
  final String error;

  AccountStateError(this.error);
  List<Object?> get props => [error];
}