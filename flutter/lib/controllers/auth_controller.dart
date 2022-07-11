import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_services.dart';
import '../views/auth_screen/auth_screen.dart';

class AuthController extends GetxController{
  Auth auth = Auth.signup;

  AuthServices authServices = AuthServices();
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  //
  void signUpUser(BuildContext context) {
    authServices.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
  }

  void signInUser(BuildContext context) {
    authServices.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

}