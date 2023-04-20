import 'package:get/get.dart';

import 'splash_controller.dart';

/// @class : SplashBinding
/// @date : 2021/08/16
/// @name : jhf
/// @description :启动页 binding层
class SplashBinding extends Bindings {

  ///所有通过Getx来实现的，需要用GetPage或者通过 Get.to() 来展示的页面，都需要绑定一个Bindings，通过下面的方法来抛出一个页面对象。
  ///⚠️ 但没懂这个页面用在哪里

  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
