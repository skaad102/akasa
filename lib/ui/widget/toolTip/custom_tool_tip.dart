import 'package:flutter/material.dart';
import 'package:metooltip/metooltip.dart';
import 'tool_default.dart';

/* https://github.com/secret344/flutter-tooltip/blob/main/example/example-2/lib/main.dart */
class CustomTooltip extends TooltipBase {
  final String message;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final TextStyle? textStyle;
  final Offset target;
  final double allOffset;
  final PreferOrientation preferOri;
  final OverlayEntry entry;
  final Size targetSize;
  final Function customDismiss;
  final Color? triangleColor;
  CustomTooltip(
      {Key? key,
      required this.message,
      required this.height,
      this.triangleColor,
      this.padding,
      this.margin,
      this.decoration,
      this.textStyle,
      required Animation<double> animation,
      required this.target,
      required this.allOffset,
      required this.preferOri,
      required this.entry,
      required this.targetSize,
      required this.customDismiss})
      : super(
            key: key,
            message: message,
            height: height,
            triangleColor: triangleColor,
            padding: padding,
            margin: margin,
            decoration: decoration,
            animation: animation,
            textStyle: textStyle,
            target: target,
            allOffset: allOffset,
            preferOri: preferOri,
            entry: entry,
            targetSize: targetSize,
            customDismiss: customDismiss);

  @override
  Widget getDefaultComputed(Animation<double>? animation) => myTooltipDefault(
        message: message,
        height: height,
        padding: padding,
        margin: margin,
        decoration: decoration,
        textStyle: textStyle,
      );

  @override
  Widget customTipPainter() {
    return CustomPaint(
        size: Size(15.0, 10),
        painter:
            DefTrianglePainter(preferSite: preferOri, color: triangleColor));
  }

  @override
  void clickTooltip(customDismiss) {
    print("消失");
    customDismiss();
  }
}
