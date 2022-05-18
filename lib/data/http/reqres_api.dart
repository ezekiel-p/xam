import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../../core/constants/strings.dart';
import '../../logic/bloc/reqres_state.dart';

class ReqresAPI {
  Future<http.Response> createNewDiary(ReqResState state) async {
    List<String> mediaBase64 = [];

    if (state.attachments != null && state.attachments!.isNotEmpty) {
      mediaBase64 = await uploadMedia(state);
    }

    final url = Uri.parse('${Strings.baseUrl}/api/createDiary');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'include_in_photo_gallery': state.includeInPhotoGallery,
          'comments': state.comments,
          'date': state.date,
          'area': state.area,
          'task_category': state.taskCategory,
          'tags': state.tags,
          'event': state.event,
          'link_to_existing_event': state.linkToExistingEvent,
          'mediasBase64': mediaBase64
        }));
    print(response.body);
    return response;
  }

  Future<List<String>> uploadMedia(ReqResState state) async {
    final List<String> mediaBase64 = [];
    try {
      Response response;
      final dio = Dio();

      if (state.attachments!.isNotEmpty) {
        for (final element in state.attachments!) {
          // final formData = FormData.fromMap(<String, dynamic>{
          //   'file': basename(element),
          // });

          // var test = await MultipartFile.fromFile(element,
          //     filename: basename(element));

          //print(test.);

          final formData = jsonEncode(<String, dynamic>{
            'file': basename(element),
          });
          response = await dio.post(
            '${Strings.baseUrl}/media',
            data: formData,
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
          );

          mediaBase64.add(json.encode(response.data["file"]));
        }
      }
      return mediaBase64;
    } catch (e) {
      return [];
    }
  }
}
