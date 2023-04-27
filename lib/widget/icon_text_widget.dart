import 'package:blog/res/colors.dart';
import 'package:blog/res/style.dart';
import 'package:flutter/material.dart';


/// @class : IconTitleWidget
/// @date : 2021/08/23
/// @name : jhf
/// @description :公共图标-标题-右侧标题样式
class IconTitleWidget extends StatelessWidget {

  ///图标
  IconData? icon;
  ///右侧图标
  IconData endIcon = Icons.arrow_forward_ios;
  ///标题文字
  String text = "";
  ///图标大小
  double size = 24;
  ///右侧图标大小
  double endSize = 16;
  ///图标颜色
  Color color = Colors.black;
  ///右侧图标颜色
  Color endColor = Colors.black;

  GestureTapCallback? onTap;

  IconTitleWidget(
      {Key? key,
      this.text = "",
      this.icon,
      this.endIcon = Icons.arrow_forward_ios,
      this.size = 24,
      this.endSize = 16,
      this.color = Colors.black,
      this.endColor = Colors.black,
      this.onTap
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Material是一种特殊的widget，它提供了一个视觉设计的基础
    return Material(
      color: Colors.transparent,
      child:  InkWell(
        splashColor: ColorStyle.color_E2E3E8_66,
        onTap: onTap,
        child:  Container(
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          /// 这段代码使用了 Stack 组件来将三个 Positioned 组件叠加在一起。Stack 组件可以让其子组件按照指定的顺序叠加显示，类似于图层的概念.
          child: Stack(
          alignment: AlignmentDirectional.centerStart,
            children: [
              Positioned(
                child: Icon(
                  icon,
                  size: size,
                  color: color,
                ),
              ),
              Positioned(
                left: 36,
                child: Text(
                  text,
                  style: Styles.style_black_15,
                ),
              ),
              Positioned(
                right: 16,
                child: Icon(
                  endIcon,
                  size: endSize,
                  color: endColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
