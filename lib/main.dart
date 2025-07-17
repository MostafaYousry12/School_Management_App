import "package:flutter/material.dart";
import "package:school_management_app/features/login_feature/presentation/view/login_view.dart";
import "package:google_fonts/google_fonts.dart";

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
