import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

class AttachmentWidget extends StatefulWidget {
  const AttachmentWidget(
      {Key? key, required this.url, required this.onTap, this.size})
      : super(key: key);

  final String url;
  final Function() onTap;
  final double? size;

  @override
  State<AttachmentWidget> createState() => _AttachmentWidgetState();
}

class _AttachmentWidgetState extends State<AttachmentWidget> {
  @override
  Widget build(BuildContext context) {
    final String? mimeStr = lookupMimeType(widget.url);
    final fileType = mimeStr!.split('/');

    return Stack(
      alignment: Alignment.topRight,
      children: [
        if (fileType[0] == 'image')
          Container(
            padding: const EdgeInsets.all(10.0),
            height: widget.size ?? 160,
            width: widget.size ?? 160,
            child: Image.file(
              File(widget.url),
              fit: BoxFit.cover,
            ),
          )
        else
          Container(),
        Positioned(
            child: InkWell(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50.0)),
            child: const Icon(
              Icons.close,
              size: 20,
              color: Colors.white,
            ),
          ),
        ))
      ],
    );
  }
}
