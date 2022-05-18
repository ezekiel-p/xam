import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/doubles.dart';

class RRElevatedPrimaryButtonWidget extends StatefulWidget {
  const RRElevatedPrimaryButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.fontSize,
      this.transparent,
      this.elevation,
      this.color,
      this.isDisabled})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final double? elevation;
  final Color? color;
  final bool? isDisabled;

  //Optional Parameters
  final bool? transparent;

  @override
  _RRElevatedPrimaryButtonWidgetState createState() =>
      _RRElevatedPrimaryButtonWidgetState();
}

class _RRElevatedPrimaryButtonWidgetState
    extends State<RRElevatedPrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            elevation: widget.elevation ?? 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Doubles.defaultRadius),
            ),
            shadowColor: widget.transparent == null
                ? widget.color ?? Theme.of(context).primaryColor
                : widget.transparent!
                    ? Colors.transparent
                    : Theme.of(context).primaryColor,
            primary: widget.transparent == null
                ? widget.color ?? Theme.of(context).primaryColor
                : widget.transparent!
                    ? Colors.transparent
                    : Theme.of(context).primaryColor),
        onPressed: widget.isDisabled == true ? null : widget.onPressed,
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: widget.fontSize ?? 10.sp,
            fontWeight: FontWeight.bold,
            color: widget.transparent == null
                ? Colors.white
                : widget.transparent!
                    ? Theme.of(context).primaryColor
                    : Colors.white,
          ),
        ));
  }
}
