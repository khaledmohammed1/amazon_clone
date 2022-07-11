import 'package:amazon_clone/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UserController userController =UserController();
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),centerTitle: true,),
      body: Center(child: Text(userController.id.toString()),),
    );
  }
}
