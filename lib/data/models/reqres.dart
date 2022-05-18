import 'package:flutter/material.dart';

class ReqRes {
  String? includeInPhotoGallery;
  String? comments;
  String? date;
  String? area;
  String? taskCategory;
  String? tags;
  String? event;
  String? mediasBase64;
  String? isLinkToExistingEvent;

  List<ReqRes> reqResList = [];
  List<ReqRes> get getAll => reqResList;

  ReqRes();

  ReqRes.fromList(List<dynamic> itemList) {
    try {
      for (final dynamic item in itemList) {
        reqResList.add(ReqRes.fromJSON(item as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("e patient data list $e");
    }
  }

  ReqRes.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      includeInPhotoGallery = jsonMap['include_in_photo_gallery'] != null
          ? jsonMap['include_in_photo_gallery'].toString()
          : '';
      comments = jsonMap['id'] != null ? jsonMap['id'].toString() : '';
      date = jsonMap['date'] != null ? jsonMap['date'].toString() : '';
      area = jsonMap['area'] != null ? jsonMap['area'].toString() : '';
      taskCategory = jsonMap['task_category'] != null
          ? jsonMap['task_category'].toString()
          : '';
      tags = jsonMap['tags'] != null ? jsonMap['tags'].toString() : '';
      event = jsonMap['event'] != null ? jsonMap['event'].toString() : '';
      mediasBase64 = jsonMap['mediasBase64'] != null
          ? jsonMap['mediasBase64'].toString()
          : '';
      isLinkToExistingEvent = jsonMap['link_to_existing_event'] != null
          ? jsonMap['link_to_existing_event'].toString()
          : '';
    } catch (e) {
      includeInPhotoGallery = '';
      comments = '';
      date = '';
      area = '';
      taskCategory = '';
      tags = '';
      event = '';
      mediasBase64 = '';
      isLinkToExistingEvent = '';
    }
  }
}
