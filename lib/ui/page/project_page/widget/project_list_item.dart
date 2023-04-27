import 'package:blog/model/project_model.dart';
import 'package:blog/res/colors.dart';
import 'package:blog/res/r.dart';
import 'package:blog/res/style.dart';
import 'package:blog/routes/routes.dart';
import 'package:blog/util/web_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

/// @class : ProjectListItem
/// @date : 2021/08/23
/// @name : jhf
/// @description :项目列表item widget
class ProjectListItem extends StatelessWidget {
  ProjectDetail detail;

  Function(bool) onResult;

  ProjectListItem(
    this.detail,
    this.onResult, {
    Key? key,
  }) : super(key: key); ///如果我们没有手动指定 key 参数，Flutter 会自动生成一个默认的 key。默认的 key 是基于 widget 的 runtimeType 和 widget 的哈希值计算出来的，通常情况下，这样的 key 能够保证唯一性。

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => WebUtil.toWebPage(detail , onResult: onResult),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(///背景装饰器
            color: Colors.red,
            border: Border(
                bottom:
                    BorderSide(width: 0.5, color: ColorStyle.color_EFF1F8))),
        padding: const EdgeInsets.all(8.0),
        child: Row( ///Row可以沿水平方向排列其子widget
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column( ///Column可以在垂直方向排列其子组件
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///标题
                  Text(
                    detail.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.style_black_16_bold,
                  ),
                  Box.vBox10, ///间距Box
                  ///部分内容
                  Text(
                    detail.desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Styles.style_6A6969_14,
                  ),
                  Box.vBox10,
                  ///作者
                  Row(
                    children: [
                      SvgPicture.asset(
                          R.assetsImagesProgram,
                        width: 16,
                      ),
                      Box.hBox10,
                      Text(
                        detail.author,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.style_6A6969_14,
                      )
                    ],
                  ),
                  Box.vBox10,
                  ///发布时间
                  Row(
                    children: [
                      SvgPicture.asset(
                        R.assetsImagesDateTime,
                        width: 16,
                      ),
                      Box.hBox10,
                      Text(
                        detail.niceDate,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.style_6A6969_14,
                      )
                    ],
                  )

                ],
              ),
            ),
            Box.hBox5,
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                detail.envelopePic,
                fit: BoxFit.fill,
                width: 72,
                height: 128,
              ),
            )
          ],
        ),
      ),
    );
  }
}
