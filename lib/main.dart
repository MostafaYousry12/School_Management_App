import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:school_management_app/features/login_feature/presentation/view/login_view.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:school_management_app/core/utils/app_routers.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(.1),
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp.router(
      routerConfig: AppRouters.router,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
