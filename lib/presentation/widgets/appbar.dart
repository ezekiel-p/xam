import 'package:flutter/material.dart';

Widget getAppBar(GlobalKey<ScaffoldState>? scaffoldKey, BuildContext context,
    {String? title,
    bool? withBackButton,
    bool? withLeadingIcon,
    Color? backgroundColor,
    double? elevation,
    Color? backbuttonColor,
    Color? titleColor,
    List<Key>? appBarKeys,
    bool? isTooltipActive,
    VoidCallback? onToolTipTap}) {
  return AppBar(
      elevation: elevation,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      toolbarHeight: 80,
      leadingWidth: 70,
      iconTheme: IconThemeData(
          color: backbuttonColor ?? Theme.of(context).primaryColor),
      automaticallyImplyLeading: withBackButton ?? false,
      centerTitle: withBackButton ?? false,
      leading: withLeadingIcon ?? false
          ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
              color: Colors.white,
            )
          : null,
      title: Text(title ?? 'No Title'));
}
