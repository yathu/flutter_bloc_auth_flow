import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_cubit.dart';
import 'package:whfms_mobile_app/auth/auth_repository.dart';
import 'package:whfms_mobile_app/auth/form_submition_status.dart';
import 'package:whfms_mobile_app/auth/sign_up/sign_up_event.dart';
import 'package:whfms_mobile_app/auth/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  SignUpBloc({this.authRepo, this.authCubit}) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {

    if (event is SignUpUsernameChanged) {
      yield state.copyWith(username: event.username);

    } else if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);

    }else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);

    } else if (event is SignUpSubmitted) {

      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.signUp(userName: state.username, email: state.email, password: state.password);
        yield state.copyWith(formStatus: SubmissionSuccess());

        authCubit.showConfirmSignUp(
          username: state.username,
          email: state.email,
          password: state.password,
        );

      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
