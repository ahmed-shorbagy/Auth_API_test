import 'package:get/get.dart';

class BaseApiService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    baseUrl = "https://teleject-backend-nestjs-p2t2qinwsa-uc.a.run.app";
  }
}
