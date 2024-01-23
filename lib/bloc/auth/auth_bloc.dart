import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toko_patu_app/models/sign_in_model.dart';
import 'package:toko_patu_app/models/sign_up_model.dart';
import 'package:toko_patu_app/models/user_model.dart';

import '../../services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService = AuthService();

  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      try {
        emit(AuthLoading());

        Map<String, dynamic> data = await authService.login(SignInModel(
            email: event.data.email, password: event.data.password));
        if (data['error'] != true) {
          User user = data['data'];
          emit(AuthSuccess(user));
        } else {
          String message = data['message'];
          emit(AuthError(message));
        }
      } catch (e) {
        emit(AuthError('$e'));
      }
    });

    on<SignUpEvent>((event, emit) async {
      try {
        emit(AuthLoadingRegister());

        Map<String, dynamic> data = await authService.register(
          SignUpModel(
            name: event.data.name,
            email: event.data.email,
            username: event.data.username,
            password: event.data.password,
          ),
        );

        if (data['error'] != true) {
          User user = data['data'];

          emit(AuthSuccess(user));
        } else {
          String message = data['message'];
          emit(AuthError(message));
        }
      } catch (e) {
        emit(AuthError('$e'));
      }
    });

    on<SignOutEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        Map<String, dynamic> status = await authService.logout(event.user);

        if (status['error'] != true) {
          AuthSuccessLogout();
        } else {
          AuthError('${status['message']}');
        }
      } catch (e) {
        emit(AuthError('$e'));
      }
    });

    on<AuthGetCurrentUserEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final Map<String, dynamic> data =
            await authService.getCredentialFromLocal();
        // print('makan');
        if (data['error'] != true) {
          SignInModel signInModel = data['data'];
          Map<String, dynamic> user = await authService.login(signInModel);

          User currentUser = user['data'];
          emit(AuthSuccess(currentUser));
        } else {
          emit(AuthErrorCredential());
        }
      } catch (e) {
        emit(AuthError('$e'));
      }
    });
  }
}
