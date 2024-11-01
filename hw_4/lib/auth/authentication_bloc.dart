import 'package:bloc/bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.unauthenticated()) {
    on<AuthenticationLoginRequested>((event, emit) {
      emit(const AuthenticationState.authenticated());
    });

    on<AuthenticationLogoutRequested>((event, emit) {
      emit(const AuthenticationState.unauthenticated()); // Handle logout by setting state to unauthenticated
    });
  }
}