import 'package:amazon_clone/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../helper/constants/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: Get.put(AuthController()),
      builder:(controller)=>  Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   ListTile(
                    tileColor: controller.auth == Auth.signup
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundColor,
                    title: const Text(
                      'Create Account',
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signup,
                      groupValue: controller.auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          controller.auth = val!;
                        });
                      },
                    ),
                  ),
                  if (controller.auth == Auth.signup) //_auth == Auth.signup
                    Container(
                      padding: const EdgeInsets.only(top: 8,bottom: 16,right: 8,left: 8),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                        key: controller.signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: controller.nameController,
                              hintText: 'Name',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: controller.emailController,
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              obscureText: true,
                              controller: controller.passwordController,
                              hintText: 'Password',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign Up',
                              onTap: () {
                                if (controller.signUpFormKey.currentState!.validate()) {
                                  controller.signUpUser(context);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                   ListTile(
                    tileColor:  controller.auth == Auth.signin
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundColor,
                    title: const Text(
                      'Sign-In.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signin,
                      groupValue: controller.auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          controller.auth = val!;
                        });
                      },
                    ),
                  ),
                  if (controller.auth == Auth.signin)//
                    Container(
                      padding: const EdgeInsets.only(top: 8,bottom: 16,right: 8,left: 8),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                        key: controller.signInFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: controller.emailController,
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              obscureText: true,
                              controller: controller.passwordController,
                              hintText: 'Password',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign In',
                              onTap: () {
                                if (controller.signInFormKey.currentState!.validate()) {
                                  controller.signInUser(context);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}