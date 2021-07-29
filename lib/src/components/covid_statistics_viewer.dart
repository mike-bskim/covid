import 'package:flutter/material.dart';
import 'package:flutter_covid/src/canvas/arrow_clip_path.dart';
import 'package:flutter_covid/src/util/data_utils.dart';

class CovidStatisticsViewer extends StatelessWidget {

  final String title;
  final double addedCount;
  final ArrowDirection upDown;
  final double totalCount;
  final bool dense;
  final Color titleColor;
  final Color subValueColor;
  final double spacing;

  CovidStatisticsViewer({
    Key? key,
    required this.title,
    required this.addedCount,
    required this.upDown,
    required this.totalCount,
    this.titleColor = const Color(0xff4c4e5d),
    this.spacing = 10,
    this.subValueColor = Colors.black,
    this.dense = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _color = Colors.black;
    switch (upDown) {
      case ArrowDirection.UP:
        _color = Color(0xffcf5f51);
        break;
      case ArrowDirection.MIDDLE:
//        _color = Color(0xff);
        break;
      case ArrowDirection.DOWN:
        _color = Color(0xff3749be);
        break;
    }

    return Column(
      children: [
        Text(title,
            style: TextStyle(color: titleColor, fontSize: dense ? 14 : 18)),
        SizedBox(height: spacing,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: ArrowClipPath(direction: upDown),
              child: Container(
                height: dense ? 10 : 20,
                width: dense ? 10 : 20,
                color: _color, //Color(0xffcf5f51),
              ),
            ),
            SizedBox(width: 5,),
            Text(DataUtils.numberFormat(addedCount),
                style: TextStyle(
                    color: _color, //Color(0xffcf5f51),
                    fontSize: dense ? 25 : 50,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: spacing * 0.5,),
        Text(DataUtils.numberFormat(totalCount),
            style: TextStyle(color: subValueColor, fontSize: dense ? 15 : 20)),
      ],
    );
  }
}
