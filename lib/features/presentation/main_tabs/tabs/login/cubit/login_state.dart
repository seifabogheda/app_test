part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginState {
  final String error;

  const LoginFailed({this.error = ''});
  @override
  List<Object> get props => [error];
}

class LoginNoInternet extends LoginState {
  @override
  List<Object> get props => [];
}
