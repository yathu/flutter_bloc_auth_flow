import 'package:whfms_mobile_app/auth/form_submition_status.dart';

class ConfirmationState{
  final String confirmationCode;
  final FormSubmissionStatus formStatus;

  bool get isValidConfirmationCode => confirmationCode.length == 6;

  ConfirmationState({
    this.confirmationCode='',
    this.formStatus = const InitialFormStatus(),
  });

  ConfirmationState copyWith({
    String confirmationCode,
    FormSubmissionStatus formStatus
  }){
    return ConfirmationState(
      confirmationCode: confirmationCode ?? this.confirmationCode,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}