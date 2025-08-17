import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final user = credential.user;

      if (user != null) {
        if (user.emailVerified) {
          emit(LoginSuccess());
        } else {
          emit(LoginNeedVerification());
        }
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Email address is not valid.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid credentials. Try again.';
      } else {
        errorMessage = 'Authentication error: ${e.message}';
      }
      emit(LoginFailed(errorMessage));
    }
  }
}
