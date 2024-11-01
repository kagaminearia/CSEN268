import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hw_4/auth/authentication_state.dart';
import 'package:hw_4/bloc/book_event.dart';
import 'auth/authentication_bloc.dart';
import 'bloc/book_bloc.dart';
import 'pages/login_page.dart';
import 'pages/main_scaffold.dart'; // Import MainScaffold here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthenticationBloc()),
        BlocProvider(create: (_) => BookBloc()),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listenWhen: (previous, current) => previous.isLoggedIn != current.isLoggedIn,
        listener: (context, state) {
          if (state.isLoggedIn) {
            context.read<BookBloc>().add(LoadBooks());
          }
        },
        child: const MyRouterApp(),
      ),
    );
  }
}

class MyRouterApp extends StatelessWidget {
  const MyRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();

    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const MainScaffold(), // Use MainScaffold here
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
      ],
      redirect: (context, state) {
        final isLoggedIn = authBloc.state.isLoggedIn;
        final loggingIn = state.location == '/login';

        // Redirect to login if not logged in and trying to access other pages
        if (!isLoggedIn && !loggingIn) return '/login';
        
        // Redirect to home if already logged in and trying to access login page
        if (isLoggedIn && loggingIn) return '/';

        return null;
      },
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
    );

    return MaterialApp.router(
      routerConfig: router,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

// Helper class to listen to the AuthenticationBloc stream
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream stream) {
    stream.listen((_) {
      notifyListeners();
    });
  }
}
