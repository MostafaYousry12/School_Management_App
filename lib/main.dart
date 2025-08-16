import "package:flutter_bloc/flutter_bloc.dart";
import "package:school_management_app/features/auth_feature/login_feature/presentation/viewmodel/cubit/login_cubit.dart";
import "package:school_management_app/features/auth_feature/register_feature/presentation/view_model/cubit/register_cubit.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:school_management_app/core/utils/app_routers.dart';
import "package:school_management_app/observe.dart";

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(.1),
      statusBarIconBrightness: Brightness.light,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => LoginCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
