import 'package:blog/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @class : TitleContentWidget
/// @date : 2021/08/20
/// @name : jhf
/// @description : 顶部明细，底部des
class TitleContentWidget extends StatelessWidget {

  ///标题
  String title = "";
  ///内容
  String content = "";

  GestureTapCallback? onTap;

  TitleContentWidget({Key? key,
    this.title = "",
    this.content = "",
    this.onTap
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      ///InkWell 是一个响应触摸的组件，它可以在被点击时出现“水波纹”效果，并触发相应的回调函数。
      ///在 InkWell 内部，它会包裹一个子组件，当触摸事件发生时，它会根据触摸的位置生成一个“水波纹”效果，并调用回调函数执行相应的操作。
      ///主要是为了以便于提高用户的交互体验
      child: InkWell(
        onTap: onTap,
        child:  Column(
          children: [
            Text(
              content,
              style: Styles.style_black_18_bold,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                style: Styles.style_6A6969_14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
