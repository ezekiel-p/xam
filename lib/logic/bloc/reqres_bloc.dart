import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/reqres.dart';
import '../../data/repositories/reqres_repository.dart';
import '../form_submission_status.dart';
import 'reqres_event.dart';
import 'reqres_state.dart';

class ReqResBloc extends Bloc<ReqResEvent, ReqResState> {
  final ReqResRepository reqResRepo;

  ReqRes? reqRes;

  ReqResBloc({required this.reqResRepo}) : super(ReqResState());

  @override
  Stream<ReqResState> mapEventToState(ReqResEvent event) async* {
    if (event is CreateNewDiary) {
      yield state.copyWith(formStatus: FormWaiting());
      await reqResRepo.createNewDiary(state).then((value) {
        if (value != null) {
          reqRes = ReqRes.fromJSON(value);
        }
      });
      yield state.copyWith(reqRes: reqRes);

      yield state.copyWith(formStatus: SubmissionSuccess());
    } else if (event is IsIncludeInPhotoGalleryChanged) {
      yield state.copyWith(includeInPhotoGallery: event.isInclude);
    } else if (event is CommentsChanged) {
      yield state.copyWith(comments: event.comments);
    } else if (event is GetAttachments) {
      yield state.copyWith(attachments: event.attachments);
    } else if (event is DateChanged) {
      yield state.copyWith(date: event.date);
    } else if (event is AreaChanged) {
      yield state.copyWith(area: event.area);
    } else if (event is TaskCategoryChanged) {
      yield state.copyWith(taskCategory: event.taskCategory);
    } else if (event is TagsChanged) {
      yield state.copyWith(tags: event.tags);
    } else if (event is EventChanged) {
      yield state.copyWith(event: event.event);
    } else if (event is IsLinkToExistingEvent) {
      yield state.copyWith(linkToExistingEvent: event.isLink);
    } else if (event is FormStatusChanged) {
      yield state.copyWith(formStatus: event.formStatus);
    }
  }
}
