import 'package:blog/app/package_info.dart';
import 'package:blog/base/get/get_save_state_view.dart';
import 'package:blog/res/colors.dart';
import 'package:blog/res/shadow_style.dart';
import 'package:blog/res/strings.dart';
import 'package:blog/res/style.dart';
import 'package:blog/routes/routes.dart';
import 'package:blog/ui/dialog/dialog_share_appliction.dart';
import 'package:blog/ui/page/my_page/my_controller.dart';
import 'package:blog/ui/page/my_page/widget/head_circle_widget.dart';
import 'package:blog/ui/page/my_page/widget/title_content_widget.dart';
import 'package:blog/util/constant.dart';
import 'package:blog/widget/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @class : MyPage
/// @date : 2021/08/20
/// @name : jhf
/// @description :我的 View层
class MyPage extends GetSaveView<MyController> {
  const MyPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white, // 设置背景色为灰色
      body: Container(
        /// 表Dart 内置的常量，表示正无穷大。
        /// 它可以用在需要指定一个较大数值的场景，比如一个容器的宽度或高度，可以将其设置为 double.infinity 来表示其可以无限延伸。
        /// 在布局中，使用 double.infinity 可以方便地实现类似于自适应、充满等效果。
        width: double.infinity,
        margin: const EdgeInsets.only(top: kTextTabBarHeight + 6),
        // color: Colors.white, ///设背景
        child: Column(
          children: [
            Row(
              children: [
                ///头像
                GestureDetector( ///GestureDetector 是 Flutter 中的一个 Widget，它用于识别手势事件并将其转化为特定的操作
                  onTap: () => Get.toNamed(Routes.userInfoPage),
                  child:  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: HeadCircleWidget(
                      width: 72,
                      height: 72,
                    ),
                    decoration: ShadowStyle.black12Circle40(),
                  ),
                ),

                ///用户名称
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    controller.userInfo.nickname,
                    style: Styles.style_1A2F51_18,
                  ),
                ),

                ///占位
                const Expanded(
                  child: Text(''), // 中间用Expanded控件
                ),

                ///设置
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.settingPage),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Container(
                      color: ColorStyle.color_F3F3F3,
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: const Icon(Icons.settings),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
              ///decoration 是用于装饰一个 widget 的属性，通常用于美化 widget 的外观，例如添加背景颜色、边框、圆角、阴影等效果。
              ///decoration 属性是一个 BoxDecoration 类型的对象
              decoration: ShadowStyle.white12Circle(),
              child: Flex( ///Flex 组件是 Row 和 Column 组件的父组件，
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: Axis.horizontal,
                children: [
                  ///收藏数量

                  ///Expanded 是一个 widget，通常用于 Row、Column 或 Flex 中的子 widget 上，用于自动填充剩余可用空间。
                  Expanded(
                    flex: 1,
                    child: TitleContentWidget(
                      title: StringStyles.homeCollect.tr,
                      content: controller.userInfo.collectIds.length.toString(),
                      onTap: () => Get.toNamed(Routes.collectPage),
                    ),
                  ),

                  ///分享列表
                  Expanded(
                    flex: 1,
                    child: Obx(() =>TitleContentWidget(
                      title: StringStyles.homePartake.tr,
                      content: '${controller.share}',
                      onTap: () => Get.toNamed(Routes.sharePage),
                    )),
                  ),

                  ///积分
                  Expanded(
                    flex: 1,
                    child: TitleContentWidget(
                      title: StringStyles.homePoints.tr,
                      content: controller.userInfo.coinCount.toString(),
                      onTap: () => Get.toNamed(Routes.pointsPage),
                    ),
                  ),

                  ///历史
                  Expanded(
                      flex: 1,
                      child: Obx(() => TitleContentWidget(
                        title: StringStyles.homeHistory.tr,
                        content: '${controller.browseHistory.value}',
                        onTap: () => Get.toNamed(Routes.historyPage),
                      ))),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
              decoration: ShadowStyle.white12Circle(),
              child: Column(children: [
                ///积分排行榜
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.rankingPage),
                  child: Container(
                    padding: const EdgeInsets.only(top: 16, left: 16, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.volume_down,
                          size: 20,
                          color: ColorStyle.color_24CF5F,
                        ),
                        Box.hBox3,
                        Text(
                          StringStyles.userPointsRanking.tr,
                          style: Styles.style_B8C0D4_13,
                        )
                      ],
                    ),
                  ),
                ),

                ///个人信息
                IconTitleWidget(
                  icon: Icons.perm_identity,
                  text: StringStyles.homeUserInfo.tr,
                  endColor: Colors.black54,
                  onTap: () => Get.toNamed(Routes.userInfoPage),
                ),

                ///关于
                IconTitleWidget(
                  icon: Icons.info_outline,
                  text: StringStyles.homeAbout.tr,
                  endColor: Colors.black54,
                  onTap: () => Get.toNamed(Routes.aboutPage),
                ),

                ///分享
                IconTitleWidget(
                  icon: Icons.share,
                  text: StringStyles.homeShare.tr,
                  endColor: Colors.black45,
                  onTap: () {
                    ///显示弹窗
                    Get.dialog(ShareDialog(url : Constant.downloadUrl));
                  },
                ),

                ///问题反馈
                IconTitleWidget(
                  icon: Icons.feedback_outlined,
                  text: StringStyles.homeFeedback.tr,
                  endColor: Colors.black45,
                  onTap: () => Get.toNamed(Routes.feedbackPage),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
