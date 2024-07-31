import 'dart:developer';

import 'package:auth_api/app/data/models/user_model/user_model.dart';
import 'package:auth_api/app/data/providers/api_service.dart';
import 'package:auth_api/app/modules/auth/controllers/user_service.dart';
import 'package:auth_api/app/routes/app_pages.dart';
import 'package:auth_api/core/errors/Faluire_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login({required String email, required String password}) async {
    isLoading.value = true;
    errorMessage.value = '';

    Either<Failure, UserModel> result =
        await _apiService.login(email, password);

    result.fold(
      (failure) {
        log("Login failed");
        log(failure.errMessage);
        errorMessage.value = failure.errMessage;
      },
      (user) async {
        final token = user.token;
        await UserService.instance.saveUser(user, token!);
        errorMessage.value = '';
        Get.offAllNamed(Routes.HOME);
      },
    );
    isLoading.value = false;
  }
}
