import 'package:get/get.dart';

import 'error_controller/error_controller_getx.dart';


class AppBindings extends Bindings{
  @override
  void dependencies() {
    ///To initialize [Page] when app start
    Get.put(SnackBarControllerGetx());
    // Get.put(TableResultGetx());
  }

}