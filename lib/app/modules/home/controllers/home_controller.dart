import 'package:auth_api/app/data/models/user_model/user_model.dart';
import 'package:auth_api/app/modules/auth/controllers/user_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserService userService = UserService.instance;
  UserModel user = Get.find<UserService>().user.value!;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    await userService.loadUser();
  }
}
