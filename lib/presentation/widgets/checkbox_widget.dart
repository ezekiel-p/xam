import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget(
      {Key? key, required this.title, this.value, this.onChange})
      : super(key: key);

  final String title;
  final bool? value;
  final Function(bool?)? onChange;

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.black),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 1),
        activeColor: const Color(0xff97d700),
        title: Text(widget.title, style: const TextStyle(color: Colors.grey)),
        value: widget.value,
        onChanged: widget.onChange,
      ),
    );
  }
}
