part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthLoadingRegister extends AuthState {}
final class AuthSuccess extends AuthState {
  AuthSuccess(this.user);

  User user;
}
final class AuthSuccessRegister  extends AuthState {
  AuthSuccessRegister (this.user);

  User user;
}

final class AuthSplashSuccess extends AuthState{}
final class AuthError extends AuthState {
 AuthError(this.message);

 String message;
}
final class AuthErrorRegister extends AuthState {
 AuthErrorRegister(this.message);

 String message;
}
