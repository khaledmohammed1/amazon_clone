import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UserController());


  }

}
