import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management_app/features/login_feature/presentation/view/login_view.dart';

abstract class AppRouters {
  static const kHomeView = '/HomeView';
  static const kRegisterView = '/RegisterView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
