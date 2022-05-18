import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';
import '../../../data/models/reqres.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.resReq}) : super(key: key);

  final ReqRes resReq;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.result.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.resReq.includeInPhotoGallery!),
            Text(widget.resReq.mediasBase64!),
            Text(widget.resReq.comments!),
            Text(widget.resReq.date!),
            Text(widget.resReq.area!),
            Text(widget.resReq.taskCategory!),
            Text(widget.resReq.tags!),
            Text(widget.resReq.isLinkToExistingEvent!),
            Text(widget.resReq.event!),
            Text(
              ('If data is blank just fill up the field').toUpperCase(),
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
