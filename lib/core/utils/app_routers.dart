import 'package:go_router/go_router.dart';
import 'package:school_management_app/features/auth_feature/login_feature/presentation/view/login_view.dart';
import 'package:school_management_app/features/auth_feature/register_feature/presentation/view/register_view.dart';
import 'package:school_management_app/features/home/presentation/view/home_view.dart';

abstract class AppRouters {
  static const kHomeView = '/HomeView';
  static const kRegisterView = '/RegisterView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
