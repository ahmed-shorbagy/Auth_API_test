import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            controller.user.user?.email ?? "error",
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            controller.user.user?.username ?? "error",
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            controller.user.user?.role ?? "error",
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
