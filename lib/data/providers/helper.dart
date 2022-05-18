import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gmo_media_picker/media_picker.dart';
import 'package:intl/intl.dart';

import '../../core/constants/doubles.dart';

Future<void> getMediaPicker(
  BuildContext context,
  Function(File?) onFileLoad,
) async {
  GmoMediaPicker.picker(
    context,
    mulCallback: (List<AssetEntity> assets) {
      for (final element in assets) {
        element.loadFile(isOrigin: false).then((value) {
          onFileLoad(value);
        });
      }
    },
    isMulti: true,
    // ignore: avoid_redundant_argument_values
    limit: Doubles.mediaPickerLimit,
  );
}

String formatDate(DateTime date) {
  try {
    return DateFormat('y-MM-dd').format(date);
  } catch (e) {
    return "";
  }
}

void showMessageBlock(BuildContext context,
    {required String title,
    Widget? attachment,
    required String content,
    List<Widget>? actions,
    Function()? onpressed}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
        ),
        content: attachment == null
            ? Text(content,
                style: const TextStyle(
                  fontSize: 16,
                ))
            : SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(content,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).secondaryHeaderColor)),
                    Expanded(
                      child: attachment,
                    )
                  ],
                ),
              ),
        actions: actions ??
            [
              TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  if (onpressed != null) {
                    onpressed();
                  }
                  Navigator.pop(context);
                },
              ),
            ],
      );
    },
  );
}
