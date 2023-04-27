import 'package:blog/ui/page/complex_module/ask_page/ask_controller.dart';
import 'package:blog/ui/page/complex_module/complex_page/complex_controller.dart';
import 'package:blog/ui/page/complex_module/main_page/main_controller.dart';
import 'package:blog/ui/page/complex_module/square_page/square_controller.dart';
import 'package:blog/ui/page/my_page/my_controller.dart';
import 'package:blog/ui/page/project_page/project_controller.dart';
import 'package:get/get.dart';


/// @class : HomeBinding
/// @date : 2021/08/20
/// @name : jhf
/// @description :首页 binding层
class HomeBinding extends Bindings {

  ///Bindings 主要配合 GetX 路由和依赖一起使用，作用是在路由跳转页面加载时注入当前页面所需的依赖关系
  ///Bindings 的好处是能统一管理页面的依赖关系，当业务复杂时可能一个页面需要注入大量的依赖，此时使用 Bindings 能更方便的维护页面的依赖关系。
 /// GetX源码核心代码就是在创建页面 Widget 时获取路由传入的 Bindings ，然后依次调用 Bindings 的 dependencies 方法。

  @override
  void dependencies() {
    ///通过 lazyPut 懒加载方式注入
    ///在 CounterPage 中就能正常使用 Get.find 获取到注入的 CounterController 对象。
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => ComplexController());
    Get.lazyPut(() => AskController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => MyController());
    Get.lazyPut(() => SquareController());
  }
}
