import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management_app/core/utils/app_routers.dart';
import 'package:school_management_app/core/utils/snackbar.dart';
import 'package:school_management_app/core/utils/styles.dart';
import 'package:school_management_app/features/auth_feature/login_feature/presentation/view/widgets/custom_buttom.dart';
import 'package:school_management_app/features/auth_feature/login_feature/presentation/view/widgets/custom_clip_path.dart';
import 'package:school_management_app/features/auth_feature/login_feature/presentation/view/widgets/custom_text_field.dart';
import 'package:school_management_app/features/auth_feature/login_feature/presentation/view/widgets/top_wave_clip.dart';
import 'package:school_management_app/features/auth_feature/register_feature/presentation/view_model/cubit/register_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? email;
  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registration successful!")),
          );
        } else if (state is RegisterFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMsg)),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Positioned(
              child: CustomClipPath(
                clipper: TopWaveClipper(),
                height: 140,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 200), // space after top clipper
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Let's Register",
                                style: Styles.textStyle30
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text("Welcome",
                                style: Styles.textStyle20
                                    .copyWith(fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomInput.CustomFormInput(
                        icon: const Icon(Icons.alternate_email),
                        hintText: "Email",
                        onChange: (data) => email = data,
                      ),
                      const SizedBox(height: 10),
                      CustomInput.CustomFormInput(
                        obscureText: true,
                        icon: const Icon(FontAwesomeIcons.lock),
                        hintText: "Password",
                        onChange: (data) => password = data,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CustomButtom(
                          color: Color(0xff005897),
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              try {
                                setState(() => isLoading = true);
                                context.read<RegisterCubit>().registerUser(
                                    email: email, password: password as String);
                                Navigator.pop(context);
                              } on FirebaseAuthException catch (ex) {
                                if (ex.code == 'user-not-found') {
                                  showsnackBar(
                                      context, "No user found for that email");
                                } else if (ex.code == 'wrong-password') {
                                  showsnackBar(context,
                                      "Wrong password provided for that user");
                                }
                              } catch (ex) {
                                showsnackBar(context, "There's an Error");
                              }
                              setState(() => isLoading = false);
                            }
                          },
                          ButtomName: "Register",
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
