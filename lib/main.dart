import "package:flutter/material.dart";
import "package:school_management_app/features/login_feature/presentation/view/login_view.dart";

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginView(),
    );
  }
}
