import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Duration duration = const Duration(seconds: 6);
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 6), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }
}
