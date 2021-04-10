import 'package:whfms_mobile_app/auth/form_submition_status.dart';

class LoginState{
  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  bool get isValidUserName => username.length > 3;
  bool get isValidPassword => password.length > 6;

  LoginState({
    this.username='',
    this.password='',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String username,
    String password,
    FormSubmissionStatus formStatus
  }){
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}