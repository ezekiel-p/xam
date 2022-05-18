import '../../data/models/reqres.dart';
import '../form_submission_status.dart';

class ReqResState {
  final String includeInPhotoGallery;
  final String comments;
  final String date;
  final String area;
  final String taskCategory;
  final String tags;
  final String event;
  final List<String>? attachments;
  final ReqRes? reqRes;
  final String linkToExistingEvent;
  final FormSubmissionStatus formStatus;

  ReqResState({
    this.includeInPhotoGallery = 'false',
    this.comments = '',
    this.date = '',
    this.area = '',
    this.taskCategory = '',
    this.tags = '',
    this.event = '',
    this.attachments = const [],
    this.reqRes,
    this.linkToExistingEvent = 'false',
    this.formStatus = const InitialFormStatus(),
  });

  ReqResState copyWith(
      {String? includeInPhotoGallery,
      String? comments,
      String? date,
      String? area,
      String? taskCategory,
      String? tags,
      String? event,
      List<String>? attachments,
      ReqRes? reqRes,
      String? linkToExistingEvent,
      FormSubmissionStatus? formStatus}) {
    return ReqResState(
        includeInPhotoGallery:
            includeInPhotoGallery ?? this.includeInPhotoGallery,
        comments: comments ?? this.comments,
        date: date ?? this.date,
        area: area ?? this.area,
        taskCategory: taskCategory ?? this.taskCategory,
        tags: tags ?? this.tags,
        event: event ?? this.event,
        attachments: attachments ?? this.attachments,
        reqRes: reqRes ?? this.reqRes,
        linkToExistingEvent: linkToExistingEvent ?? this.linkToExistingEvent,
        formStatus: formStatus ?? this.formStatus);
  }
}
