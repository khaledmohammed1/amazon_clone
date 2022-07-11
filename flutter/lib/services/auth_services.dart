import 'dart:convert';


import 'package:amazon_clone/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../controllers/user_controller.dart';
import '../helper/constants/constants.dart';
import '../helper/error_handling.dart';
import '../helper/utils.dart';
import '../models/user_model.dart';

class AuthServices {
  UserController userController = UserController();

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      print(jsonDecode(res.body)['_id']);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
           UserController userController = UserController();
            userController.id = jsonDecode(res.body)['_id'].toString();
            print(userController.id);
          //  userController.token = jsonDecode(res.body)['token'];
          //  userController.name = jsonDecode(res.body)['name'];
          //  userController.email = jsonDecode(res.body)['email'];
          //  userController.password = jsonDecode(res.body)['password'];
          //  userController.address = jsonDecode(res.body)['address'];
          //  userController.type = jsonDecode(res.body)['type'];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('id', jsonDecode(res.body)['_id']);
          Get.to(() => const HomeScreen());
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // void getUserData(
  //   BuildContext context,
  // ) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('auth-token');
  //
  //     if (token == null) {
  //       prefs.setString('auth-token', '');
  //     }
  //
  //     var tokenRes = await http.post(
  //       Uri.parse('$uri/tokenIsValid'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'auth-token': token!
  //       },
  //     );
  //
  //     var response = jsonDecode(tokenRes.body);
  //
  //     if (response == true) {
  //       http.Response userRes = await http.get(
  //         Uri.parse('$uri/'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'x-auth-token': token
  //         },
  //       );
  //         print(userRes.body);
  //       // var userProvider = Provider.of<UserProvider>(context, listen: false);
  //       // userProvider.setUser(userRes.body);
  //     }
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }
}
