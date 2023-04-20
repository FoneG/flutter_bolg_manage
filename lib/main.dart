import 'package:blog/app/app_theme.dart';
import 'package:blog/res/strings.dart';
import 'package:blog/ui/page/splash_page/splash_binding.dart';
import 'package:blog/ui/page/splash_page/splash_page.dart';
import 'package:blog/util/injection_init.dart';
import 'package:blog/util/locale_util.dart';
import 'package:flutter/material.dart';
import 'package:blog/routes/routes.dart';
import 'package:blog/util/keyboard_util.dart';
import 'package:get/get.dart';


/// @class : main
/// @date : 2021/08/11
/// @name : jhf
/// @description :入口
void main()  async{
  /// WidgetsFlutterBinding是绑定widget 框架和Flutter 引擎的桥梁。
  /// 通过 ensureInitialized() 方法我们可以得到一个全局单例 WidgetsFlutterBinding。
  /// 粗略理解：监听平台消息、全局响应系统手势事件的时候需要用到它
  WidgetsFlutterBinding.ensureInitialized();
  /// 通过GetX做依赖注入，放置NSUserDefault对象，以及请求对象
  await Injection.init();

  runApp(GetMaterialApp(
    /// 定义页面路由
    getPages: Routes.routePage,
    /// Flutter 去除右上角 Debug 标签
    debugShowCheckedModeBanner: false,
    /// ⚠️设置初始路由，但不明白'/'代表什么，没发现'/'具体指代了那个页面
    initialRoute: '/',
    /// Scaffold是一个页面骨架，用于高效搭建一个主页面
    builder: (context, child) => Scaffold(
      /// GestureDetector是一个用于手势识别的功能性组件，我们通过它可以来识别各种手势。
      // Global GestureDetector that will dismiss the keyboard
      body: GestureDetector(
        onTap: () {
          KeyboardUtils.hideKeyboard(context);
        },
        child: child,
      ),
    ),
    ///主题颜色
    theme: appThemeData,
    ///国际化支持-来源配置
    translations: Messages(),
    ///国际化支持-默认语言
    locale: LocaleOptions.getDefault(),
    ///国际化支持-备用语言
    fallbackLocale: const Locale('en', 'US'),
    ///动画组件
    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
    home:  const SplashPage(),
  ));
}
