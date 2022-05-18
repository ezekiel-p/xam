abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class FormSubmitted extends FormSubmissionStatus {}

class FormWaiting extends FormSubmissionStatus {}

/* Search Form Event State */
class FormSearchEvent extends FormSubmissionStatus {}

/* Search Form User Event State */
class FormSearchUserEvent extends FormSubmissionStatus {}

/* User Filter */
class LoadGroupsAttendee extends FormSubmissionStatus {}

class LoadEventAttendee extends FormSubmissionStatus {}

class LoadFavoriteTab extends FormSubmissionStatus {}

class LoadFriendsTab extends FormSubmissionStatus {}

class LoadAllUserTab extends FormSubmissionStatus {}

class LoadUserTab extends FormSubmissionStatus {}

class LoadViewMoreUserTab extends FormSubmissionStatus {}

/* Events */
class LoadEventsTab extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class UpdateEvent extends FormSubmissionStatus {}

class MessageLoaded extends FormSubmissionStatus {}

/* Groups */
class LoadGroupsTab extends FormSubmissionStatus {}

class ClearSelection extends FormSubmissionStatus {}

/* Discussion */
class DiscussionSubmittedFailed extends FormSubmissionStatus {
  final String error;

  DiscussionSubmittedFailed(this.error);
}

class SubmissionFailed extends FormSubmissionStatus {
  final Exception e;

  SubmissionFailed(this.e);
}
