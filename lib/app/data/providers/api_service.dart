import 'dart:developer';
import 'package:auth_api/app/data/models/user_model/user_model.dart';
import 'package:auth_api/app/data/providers/base_api_service.dart';
import 'package:auth_api/core/errors/Faluire_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ApiService extends BaseApiService {
  ApiService() {
    onInit();
  }

  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      final Response response = await post(
        '/api/authenticate',
        {'email': email, 'password': password},
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Successful login');
        final user = UserModel.fromMap(response
            .body); // Ensure the response is correctly passed to fromJson
        return right(user);
      } else {
        log('Login failed');
        return left(
          ServerFailure.fromResponse(response.statusCode!, response.body),
        );
      }
    } catch (e) {
      log('Error occurred during login');
      log(e.toString());
      return left(ServerFailure.fromResponse(10, {}));
    }
  }
}
