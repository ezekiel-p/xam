import 'package:xam/logic/form_submission_status.dart';

abstract class ReqResEvent {}

class IsIncludeInPhotoGalleryChanged extends ReqResEvent {
  final String isInclude;
  IsIncludeInPhotoGalleryChanged({required this.isInclude});
}

class CommentsChanged extends ReqResEvent {
  final String comments;
  CommentsChanged({required this.comments});
}

class DateChanged extends ReqResEvent {
  final String date;
  DateChanged({required this.date});
}

class AreaChanged extends ReqResEvent {
  final String area;
  AreaChanged({required this.area});
}

class TaskCategoryChanged extends ReqResEvent {
  final String taskCategory;
  TaskCategoryChanged({required this.taskCategory});
}

class TagsChanged extends ReqResEvent {
  final String tags;
  TagsChanged({required this.tags});
}

class EventChanged extends ReqResEvent {
  final String event;
  EventChanged({required this.event});
}

class IsLinkToExistingEvent extends ReqResEvent {
  final String isLink;
  IsLinkToExistingEvent({required this.isLink});
}

class CreateNewDiary extends ReqResEvent {}

class GetAttachments extends ReqResEvent {
  final List<String> attachments;
  GetAttachments({required this.attachments});
}

class FormStatusChanged extends ReqResEvent {
  final FormSubmissionStatus formStatus;
  FormStatusChanged({required this.formStatus});
}
