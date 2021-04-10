import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_credentials.dart';
import 'package:whfms_mobile_app/auth/auth_repository.dart';
import 'package:whfms_mobile_app/session_state.dart';

class SessionCubit extends Cubit<SessionState>{
  final AuthRepository authRepository;

  SessionCubit({this.authRepository}) : super(UnKnownSessionState()){
    attemptAutoLogin();
  }

  void attemptAutoLogin() async{
    try{
      final userId = await authRepository.attemptAutoLogin();
      //final user = dataRepo.getUser(userID);
      final user = userId;
      emit(Authenticated(user: user));

    } on Exception {
      emit(UnAuthenticated());
    }
  }

  void showAuth() => emit(UnAuthenticated());

  void showSession(AuthCredentials credentials){
    //final user = dataRepo.getUser(credentials.userId);
    final user = credentials.username;
    emit(Authenticated(user: user));
  }

  void signOut(){
    authRepository.signOut();
    emit(UnAuthenticated());
  }
}