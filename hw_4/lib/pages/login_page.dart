import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_4/auth/authentication_bloc.dart';
import 'package:hw_4/auth/authentication_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Dispatch login event to AuthenticationBloc
            context.read<AuthenticationBloc>().add(AuthenticationLoginRequested());

            // Navigate to the home page (GoRouter will handle this with redirection)
          },
          child: const Text('Login to Home Page'),
        ),
      ),
    );
  }
}
