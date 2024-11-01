import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  final bool isLoggedIn;

  const AuthenticationState._({required this.isLoggedIn});

  const AuthenticationState.authenticated() : this._(isLoggedIn: true);
  const AuthenticationState.unauthenticated() : this._(isLoggedIn: false);

  @override
  List<Object> get props => [isLoggedIn];
}
