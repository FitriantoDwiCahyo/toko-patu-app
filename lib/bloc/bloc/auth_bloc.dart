import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toko_patu_app/models/sign_in_model.dart';
import 'package:toko_patu_app/models/sign_up_model.dart';
import 'package:toko_patu_app/models/user_model.dart';

import '../../providers/auth_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authService = AuthProvider();

  AuthBloc() : super(AuthInitial()) {
    on<MoveSplashEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      emit(AuthSplashSuccess());
    });

    on<SignInEvent>((event, emit) async {
      try {
        emit(AuthLoading());

        Map<String, dynamic> data = await authService.login(SignInModel(
            email: event.data.email, password: event.data.password));
        if (data['error'] != true) {
          User user = data['data'];
          print('makan');
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
            password: event.data.password),
      );

      if (data['error'] != true) {
        User user = data['data'];

        emit(AuthSuccessRegister(user));
      }else{
        String message = data['message'];
        emit(AuthErrorRegister(message));
      }
     } catch (e) {
       emit(AuthErrorRegister('$e'));
     }


    });
  }
}
