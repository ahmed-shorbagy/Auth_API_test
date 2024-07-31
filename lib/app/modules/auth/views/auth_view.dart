import 'package:auth_api/app/modules/auth/views/widgets/login_form.dart';
import 'package:auth_api/core/utils/app_colors.dart';
import 'package:auth_api/core/utils/app_images.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesLoginBackGround),
              alignment: Alignment.topCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login"
                "\n"
                "to your account",
                style: AppStyles.semiBold32,
              ),
              const SizedBox(
                height: 45,
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
