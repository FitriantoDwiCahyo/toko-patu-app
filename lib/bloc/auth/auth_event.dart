part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class MoveSplashEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  SignInEvent(this.data);

  SignInModel data;
}

class SignUpEvent extends AuthEvent {
  SignUpEvent(this.data);

  SignUpModel data;

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class SignOutEvent extends AuthEvent{
  SignOutEvent(this.user);

  User user;
}

class AuthGetCurrentUserEvent extends AuthEvent {}
